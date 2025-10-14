import 'package:flutter/material.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../widgets/offers_list.dart';
import '../widgets/trip_card.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      body: Column(
        children: [
          TripCard(),
          16.ph,
          OffersList(),
        ],
      ),
    );
  }
}
