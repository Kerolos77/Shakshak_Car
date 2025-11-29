import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapWidget extends StatelessWidget {
  const UserMapWidget({
    super.key,
    required this.onMapCreated,
    required this.padding,
    this.onCameraMove,
    this.onCameraIdle,
  });

  final CameraPosition _initialLocation = const CameraPosition(
    target: LatLng(26.8206, 30.8025), // إحداثيات جمهورية مصر العربية
    zoom: 20.0,
  );
  final Function(GoogleMapController controller) onMapCreated;
  final bool padding;
  final void Function(CameraPosition position)? onCameraMove;
  final void Function()? onCameraIdle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: double.infinity,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialLocation.target,
            zoom: 17.0,
          ),
          trafficEnabled: true,
          indoorViewEnabled: true,
          onMapCreated: onMapCreated,
          compassEnabled: true,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          mapToolbarEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMove: onCameraMove,
          onCameraIdle: onCameraIdle,
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
