import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapWidget extends StatelessWidget {
  final Function() onCameraIdle;
  final Function(CameraPosition) onCameraMove;
  final Function() onCameraMoveStarted;
  final Function(GoogleMapController) onMapCreated;
  final dynamic cubit;

  const UserMapWidget({
    required this.onCameraIdle,
    required this.onCameraMove,
    required this.onCameraMoveStarted,
    required this.onMapCreated,
    required this.cubit,
    required this.cars,
  });

  final List<LatLng> cars;

  Set<Marker> _createCarMarkers() {
    return cars
        .asMap()
        .entries
        .map(
          (entry) => Marker(
            markerId: MarkerId('car_${entry.key}'), // Unique ID for each car
            position: entry.value, // Car's LatLng position
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor
                .hueViolet), // Custom marker color (primary for car)
          ),
        )
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: cubit.mapLocation,
        zoom: 17.0,
      ),
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
      onMapCreated: onMapCreated,
      onCameraMoveStarted: onCameraMoveStarted,
      onCameraMove: onCameraMove,
      onCameraIdle: onCameraIdle,
      markers: _createCarMarkers(),
    );
  }
}
