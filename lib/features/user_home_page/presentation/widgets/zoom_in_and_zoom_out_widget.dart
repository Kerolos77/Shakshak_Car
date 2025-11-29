import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/resources/app_colors.dart';

class ZoomInAndZoomOutWidget extends StatelessWidget {
  const ZoomInAndZoomOutWidget({super.key, required this.mapController});

  final GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Zoom In",
            mini: true,
            elevation: 0.0,
            backgroundColor: AppColors.greyColor,
            onPressed: () {
              mapController?.animateCamera(CameraUpdate.zoomIn());
            },
            child: const Icon(
              Icons.add,
              size: 23,
            ),
          ),
          SizedBox(height: 18.h),
          FloatingActionButton(
            heroTag: "Zoom Out",
            mini: true,
            elevation: 0.0,
            backgroundColor: AppColors.greyColor,
            onPressed: () {
              mapController?.animateCamera(CameraUpdate.zoomOut());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
