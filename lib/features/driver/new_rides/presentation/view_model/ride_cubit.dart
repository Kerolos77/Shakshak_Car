 import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shakshak/features/driver/new_rides/presentation/view_model/ride_state.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../data/models/ride_model.dart';
import '../../data/repo/new_ride_repo.dart';

class RideCubit extends Cubit<RideState> {
  RideCubit(this.newRideRepo) : super(RideInitial());
  late WebSocketChannel channel;
  List<Ride> rides = [];
  final NewRideRepo newRideRepo;
  final mapLocation = LatLng(24.7136, 46.6753);
  Future<void> fetchRides() async {
    emit(RideLoading());
    var result = await newRideRepo.fetchNewRides();
    result.fold((fail) {
      debugPrint("error while login ${fail.message}");
      emit(RideError(fail.message));
    }, (List<Ride> rideList) {
      // print(loginModel.data!.token!);
      rides = rideList;
      emit(RideLoaded());
    });
  }


  void connectToWebSocket() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://shakshak.net:6001/app/key?protocol=7&client=js&version=4.3.1&flash=false'),
    );

    channel.stream.listen(
          (event) {
        print('📥 استقبلت: $event');
        try {
          final decoded = json.decode(event);

          if (decoded is Map &&
              decoded['event'] == 'drivers1' &&
              decoded.containsKey('data')) {
            final ride = Ride.fromJson(json.decode(decoded['data']));
            print(ride.user?.name);

              rides.add(ride);
            emit(RideLoaded());
          }
        } catch (e) {
          print('⚠️ Error decoding: $e');
        }
      },
      onError: (error) {
        print('❌ WebSocket Error: $error');
      },
      onDone: () {
        print('❌ WebSocket Disconnected');
      },
    );

    // اشترك في قناة drivers
    channel.sink.add(jsonEncode({
      "event": "pusher:subscribe",
      "data": {
        "channel": "drivers"
      }
    }));

    print('✅ تم الاتصال والاشتراك في قناة drivers');
  }
}