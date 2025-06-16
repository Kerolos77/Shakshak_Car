import 'package:flutter/material.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../../core/utils/shared_widgets/custom_drop_down.dart';

class YearsDropDown extends StatelessWidget {
  const YearsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year + 1;
    final years = List<String>.generate(
      currentYear - 1970 + 1,
      (index) => (1970 + index).toString(),
    ).reversed.toList();

    return CustomDropDown(
      label: 'Car release year',
      hint: S.of(context).selectCarModel,
      items: years,
      onChange: (selectedYear) {
        print('Selected Year: $selectedYear');
      },
    );
  }
}
