import 'package:flutter/material.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/user_home/presentation/widgets/select_vehicle_section.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../core/router/router_helper.dart';
import '../../vehicle_information/presentation/widgets/car_model_drop_down.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).car,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectVehicleSection(),
            12.ph,
            CustomTextField(
              label: S.of(context).carNumber,
              hint: S.of(context).carNumber,
              keyType: TextInputType.number,
            ),
            12.ph,
            CustomDropDown(
              label: S.of(context).carBrand,
              hint: S.of(context).carBrand,
              items: ['1', '2'],
              onChange: (p0) {},
            ),
            12.ph,
            YearsDropDown(),
            12.ph,
            CustomDropDown(
              label: S.of(context).carModel,
              hint: S.of(context).carModel,
              items: ['1', '2'],
              onChange: (p0) {},
            ),
            12.ph,
            CustomTextField(
              label: S.of(context).carColor,
              hint: S.of(context).carColor,
            ),
            24.ph,
            CustomButton(
              text: 'Done',
              onTap: () {
                navigatePop(context);
              },
            ),
            12.ph,
          ],
        ),
      ),
    );
  }
}
