import 'package:flutter/material.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/user_home/presentation/widgets/select_vehicle_section.dart';
import 'package:shakshak/generated/l10n.dart';

class OutStationView extends StatelessWidget {
  const OutStationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).outstation,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: S.of(context).from,
            ),
            12.ph,
            CustomTextField(
              hint: S.of(context).to,
            ),
            12.ph,
            const SelectVehicleSection(),
            12.ph,
            CustomTextField(
              hint: S.of(context).when,
            ),
            12.ph,
            CustomTextField(
              hint: S.of(context).numberOfPassengers,
            ),
            12.ph,
            CustomTextField(
              hint: S.of(context).enterOfferRate,
            ),
            12.ph,
            CustomDropDown(
              items: [
                S.of(context).cash,
                S.of(context).wallet,
              ],
              onChange: (p0) {},
              hint: S.of(context).selectPaymentMethod,
            ),
            20.ph,
            CustomButton(text: S.of(context).placeRide),
          ],
        ),
      ),
    );
  }
}
