import 'package:flutter/material.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../../generated/l10n.dart';
import '../widgets/trip_map_details_item.dart';

class TripMapView extends StatelessWidget {
  const TripMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).tripMap,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: TripMapDetailsItem(),
          )
        ],
      ),
    );
  }
}
