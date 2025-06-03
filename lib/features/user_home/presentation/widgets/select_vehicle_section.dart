import 'package:flutter/material.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/generated/l10n.dart';

import 'vehicle_item_widget.dart';

class SelectVehicleSection extends StatefulWidget {
  const SelectVehicleSection({super.key});

  @override
  State<SelectVehicleSection> createState() => _SelectVehicleSectionState();
}

class _SelectVehicleSectionState extends State<SelectVehicleSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).selectVehicle, style: Styles.textStyle16SemiBold),
        12.ph,
        Row(
          children: List.generate(3, (index) {
            return Row(
              children: [
                VehicleItemWidget(
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                if (index != 2) 12.pw,
              ],
            );
          }),
        ),
      ],
    );
  }
}
