import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../core/resources/app_colors.dart';
import 'header_of_place_widget.dart';
import 'loading_of_place_header_widget.dart';
import 'location_marker_loading_indicator.dart';

class MarkerOfUserOnMapWidget extends StatelessWidget {
  const MarkerOfUserOnMapWidget(
      {super.key, required this.buscando, required this.header,required this.Key});

  final bool buscando;
  final String header;
  final GlobalKey Key ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: markerHeight,
      key: Key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          buscando == true
              ? HeaderOfPlaceWidget(
                  header: header,
                )
              : LocationMarkerLoadingIndicator(),
          SizedBox(height: 5.h,),
          Icon(FontAwesomeIcons.mapPin,color: AppColors.primaryColor,size: 40.r,)
          // _getMarker(),
          // Image.asset(
          //   "assets/images/markeruser.png",
          //   height: 150.h,
          // ),
        ],
      ),
    );
  }
}
