import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shakshak/features/user_home/presentation/view_models/user_home_cubit/user_home_cubit.dart';

class UserMapWidget extends StatefulWidget {
  final Function() onCameraIdle;
  final Function(CameraPosition) onCameraMove;
  final Function() onCameraMoveStarted;
  final Function(GoogleMapController) onMapCreated;
  final UserHomeCubit cubit;

  const UserMapWidget({
    required this.onCameraIdle,
    required this.onCameraMove,
    required this.onCameraMoveStarted,
    required this.onMapCreated,
    required this.cubit,
  });

  @override
  State<UserMapWidget> createState() => _UserMapWidgetState();
}

class _UserMapWidgetState extends State<UserMapWidget> {
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.cubit.mapLocation,
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
      onMapCreated: widget.onMapCreated,
      onCameraMoveStarted: widget.onCameraMoveStarted,
      onCameraMove: widget.onCameraMove,
      onCameraIdle: widget.onCameraIdle,
      onLongPress: (LatLng position) async {
        // امسح الماركرز القديمة
        setState(() {
          _markers.clear();
        });

        widget.cubit.selectPlace(
            isSource: widget.cubit.isSourceSelected,
            lat: position.latitude,
            lng: position.longitude);

        // ضيف الماركر بالعنوان
        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId(position.toString()),
              position: position,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueMagenta,
              ),
            ),
          );
        });
      },
      markers: _markers,
    );
  }
}
