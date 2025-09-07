import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shakshak/core/constants/key_const.dart';

class DriverMapWidget extends StatefulWidget {
  final Function() onCameraIdle;
  final Function(CameraPosition) onCameraMove;
  final Function() onCameraMoveStarted;
  final Function(GoogleMapController) onMapCreated;
  final dynamic cubit;
  final List<LatLng> cars;
  final LatLng? start;
  final LatLng? end;
  final bool testMode;
  final bool userMap;

  const DriverMapWidget({
    required this.onCameraIdle,
    required this.onCameraMove,
    required this.onCameraMoveStarted,
    required this.onMapCreated,
    required this.cubit,
    required this.cars,
    this.start ,
    this.end  ,
    this.userMap = false,
    this.testMode = false,
  });

  @override
  State<DriverMapWidget> createState() => _UserMapWidgetState();
}

class _UserMapWidgetState extends State<DriverMapWidget> {
  Set<Polyline> _polylines = {};
  Set<Marker> _extraMarkers = {};
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRoute();
    });
  }

  Set<Marker> _createCarMarkers() {
    return widget.cars
        .asMap()
        .entries
        .map(
          (entry) => Marker(
        markerId: MarkerId('car_${entry.key}'),
        position: entry.value,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
      ),
    )
        .toSet();
  }

  Future<void> _loadRoute() async {
    if (widget.start == null || widget.end == null) return;

    List<LatLng> polylineCoords;

    if (widget.testMode) {
      polylineCoords = [
        widget.start!,
        LatLng(widget.start!.latitude - 0.002, widget.start!.longitude - 0.002),
        LatLng(widget.start!.latitude - 0.004, widget.start!.longitude - 0.004),
        widget.end!,
      ];
    } else {// ← استبدله بمفتاحك الصحيح
      final url = 'https://routes.googleapis.com/directions/v2:computeRoutes';

      final body = {
        "origin": {
          "location": {
            "latLng": {
              "latitude": widget.start!.latitude,
              "longitude": widget.start!.longitude,
            }
          }
        },
        "destination": {
          "location": {
            "latLng": {
              "latitude": widget.end!.latitude,
              "longitude": widget.end!.longitude,
            }
          }
        },
        "travelMode": "DRIVE",
        "routingPreference": "TRAFFIC_AWARE",
        "computeAlternativeRoutes": true,
      };

      final response = await http.post(
        Uri.parse('$url?key=${KeyConst.mapKey}'),

        headers: {
          'Content-Type': 'application/json',
          'X-Goog-FieldMask': 'routes.distanceMeters,routes.duration,routes.polyline.encodedPolyline',
        },
        body: jsonEncode(body),
      );

      final data = json.decode(response.body);
      print("✅ Routes API response: $data");

      if (data['routes'] == null || data['routes'].isEmpty) return;

      final polyline = data['routes'][0]['polyline']['encodedPolyline'];
      polylineCoords = _decodePolyline(polyline);
    }

    final bounds = _getLatLngBounds(polylineCoords);


    setState(() {
      _polylines.clear();
      _extraMarkers.clear();

      _polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: polylineCoords,
          color: Colors.blue,
          width: 5,
        ),
      );

      _extraMarkers.add(Marker(
        markerId: MarkerId('start'),
        position: widget.start!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
      _extraMarkers.add(Marker(
        markerId: MarkerId('end'),
        position: widget.end!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });

    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 50),
      );
    }
  }

  LatLngBounds _getLatLngBounds(List<LatLng> points) {
    final southwestLat = points.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
    final southwestLng = points.map((p) => p.longitude).reduce((a, b) => a < b ? a : b);
    final northeastLat = points.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);
    final northeastLng = points.map((p) => p.longitude).reduce((a, b) => a > b ? a : b);

    return LatLngBounds(
      southwest: LatLng(southwestLat, southwestLng),
      northeast: LatLng(northeastLat, northeastLng),
    );
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dLat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dLng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: widget.start ?? LatLng(30.1377568, 31.3285276),
            zoom: 17.0,
          ),
          onMapCreated: (controller) {
            _mapController = controller;
            widget.onMapCreated(controller);
          },
          trafficEnabled: true,
          indoorViewEnabled: true,
          compassEnabled: false,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          mapToolbarEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMoveStarted: widget.onCameraMoveStarted,
          onCameraMove: widget.onCameraMove,
          onCameraIdle: widget.onCameraIdle,
          markers: {..._createCarMarkers(), ..._extraMarkers},
          polylines: _polylines,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () async {
              await _loadRoute();
            },
            child: const Text('Reload Route'),
          ),
        ),
      ],
    );
  }
}
