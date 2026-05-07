import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef EventCallback = void Function(dynamic data);

enum RealtimeConnectionStatus { disconnected, connecting, connected }

class RealtimeSubscription {
  final String channel;
  final String event;
  final EventCallback callback;
  final String token;

  RealtimeSubscription({
    required this.channel,
    required this.event,
    required this.callback,
    required this.token,
  });
}

class RealtimeManager {
  static final RealtimeManager _instance = RealtimeManager._internal();
  factory RealtimeManager() => _instance;
  RealtimeManager._internal();

  WebSocketChannel? _channel;
  RealtimeConnectionStatus _status = RealtimeConnectionStatus.disconnected;
  String? _url;

  final Set<String> _activeSubscribes = {};
  final List<RealtimeSubscription> _subscriptions = [];
  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;
  bool _isManualDisconnect = false;

  final ValueNotifier<RealtimeConnectionStatus> connectionStatus =
      ValueNotifier(RealtimeConnectionStatus.disconnected);

  void _updateStatus(RealtimeConnectionStatus status) {
    _status = status;
    connectionStatus.value = status;
    debugPrint('🌐 RealtimeManager Status: $status');
  }

  /// ================= CONNECT =================
  void connect({required String url}) {
    if (_status == RealtimeConnectionStatus.connected && _url == url) return;

    _url = url;
    _isManualDisconnect = false;
    _reconnectAttempts = 0;
    _establishConnection();
  }

  void _establishConnection() {
    if (_url == null || _isManualDisconnect) return;

    _updateStatus(RealtimeConnectionStatus.connecting);
    _closeExisting();

    try {
      _channel = WebSocketChannel.connect(Uri.parse(_url!));
      _channel!.stream.listen(
        _onMessage,
        onError: _onConnectionError,
        onDone: _onConnectionClosed,
        cancelOnError: true,
      );
    } catch (e) {
      _onConnectionError(e);
    }
  }

  void _closeExisting() {
    _channel?.sink.close();
    _channel = null;
  }

  /// ================= HANDLERS =================
  void _onMessage(dynamic message) {
    debugPrint('📥 RealtimeManager Received: $message');
    try {
      final decoded = jsonDecode(message);
      final String? event = decoded['event'];
      final String? channel = decoded['channel'];
      final dynamic data = decoded['data'];

      if (event == null) return;

      // Pulse check
      if (event == 'pusher:ping') {
        _send({"event": "pusher:pong"});
        return;
      }

      // Connection Established
      if (event == 'pusher:connection_established') {
        _reconnectAttempts = 0;
        _updateStatus(RealtimeConnectionStatus.connected);
        _resubscribeAll();
        return;
      }

      if (event.startsWith('pusher:')) return;

      // Logic events
      final parsedData = (data is String) ? jsonDecode(data) : data;

      // Notify listeners matching channel AND event
      final targets = _subscriptions
          .where((s) =>
              s.channel == channel &&
              (s.event == event ||
                  ".${s.event}" == event ||
                  s.event == ".$event"))
          .toList();

      for (var sub in targets) {
        sub.callback(parsedData);
      }
    } catch (e) {
      debugPrint('❌ RealtimeManager Parse Error: $e');
    }
  }

  void _onConnectionError(dynamic error) {
    debugPrint('❌ RealtimeManager Connection Error: $error');
    _updateStatus(RealtimeConnectionStatus.disconnected);
    _scheduleReconnect();
  }

  void _onConnectionClosed() {
    if (!_isManualDisconnect) {
      debugPrint('🔌 RealtimeManager Connection Closed Unexpectedly');
      _updateStatus(RealtimeConnectionStatus.disconnected);
      _scheduleReconnect();
    }
  }

  /// ================= RECONNECT LOGIC =================
  void _scheduleReconnect() {
    if (_isManualDisconnect) return;

    _reconnectTimer?.cancel();

    // Exponential Backoff: 2s, 4s, 8s, 16s, max 30s
    final seconds = min(pow(2, _reconnectAttempts).toInt() + 2, 30);
    // Add Jitter (random +/- 1-2 seconds)
    final jitter = Random().nextInt(3);
    final delay = Duration(seconds: seconds + jitter);

    debugPrint(
        '🔄 RealtimeManager: Attempting reconnect in ${delay.inSeconds}s (Attempt: ${_reconnectAttempts + 1})');

    _reconnectTimer = Timer(delay, () {
      _reconnectAttempts++;
      _establishConnection();
    });
  }

  /// ================= ACTIONS =================
  void subscribe(String channel, {String? eventName}) {
    final subKey = eventName != null ? '$channel|$eventName' : channel;
    if (_activeSubscribes.contains(subKey)) return;

    _activeSubscribes.add(subKey);
    if (_status == RealtimeConnectionStatus.connected) {
      _rawSubscribe(channel, eventName: eventName);
    }
  }

  void _rawSubscribe(String channel, {String? eventName}) {
    debugPrint(
        '📡 RealtimeManager: Subscribing to $channel ${eventName != null ? "event: $eventName" : ""}');
    final data = <String, dynamic>{"channel": channel};
    if (eventName != null) {
      data["event"] = eventName;
    }
    _send({"event": "pusher:subscribe", "data": data});
  }

  void _resubscribeAll() {
    for (var subKey in _activeSubscribes) {
      final parts = subKey.split('|');
      final channel = parts[0];
      final eventName = parts.length > 1 ? parts[1] : null;
      _rawSubscribe(channel, eventName: eventName);
    }
  }

  String addListener({
    required String channel,
    required String event,
    required EventCallback callback,
  }) {
    subscribe(channel, eventName: event);

    final token = DateTime.now().microsecondsSinceEpoch.toString() +
        Random().nextInt(100).toString();
    _subscriptions.add(RealtimeSubscription(
      channel: channel,
      event: event,
      callback: callback,
      token: token,
    ));

    return token;
  }

  void removeListener(String token) {
    _subscriptions.removeWhere((s) => s.token == token);
  }

  void unsubscribe(String channel) {
    _activeSubscribes
        .removeWhere((key) => key == channel || key.startsWith('$channel|'));
    _subscriptions.removeWhere((s) => s.channel == channel);

    if (_status == RealtimeConnectionStatus.connected) {
      _send({
        "event": "pusher:unsubscribe",
        "data": {"channel": channel}
      });
    }
  }

  void disconnect() {
    _isManualDisconnect = true;
    _reconnectTimer?.cancel();
    _closeExisting();
    _activeSubscribes.clear();
    _subscriptions.clear();
    _updateStatus(RealtimeConnectionStatus.disconnected);
  }

  void _send(Map<String, dynamic> data) {
    if (_status != RealtimeConnectionStatus.connected) return;
    try {
      _channel?.sink.add(jsonEncode(data));
    } catch (e) {
      debugPrint('❌ RealtimeManager Send Error: $e');
    }
  }
}
