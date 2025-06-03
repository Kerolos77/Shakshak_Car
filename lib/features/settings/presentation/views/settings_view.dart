import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).settings,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.translate,
                  color: AppColors.primaryColor,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).language,
                  style: Styles.textStyle18SemiBold,
                ),
                10.pw,
                Spacer(),
                SizedBox(
                  width: 150.w,
                  child: CustomDropDown(
                    items: ['English', 'العربية'],
                    onChange: (p0) {},
                  ),
                )
              ],
            ),
            12.ph,
            Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: AppColors.darkGreyColor,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).lightDarkTheme,
                  style: Styles.textStyle18SemiBold,
                ),
                10.pw,
                Spacer(),
                SizedBox(
                  width: 150.w,
                  child: CustomDropDown(
                    items: [S.of(context).light, S.of(context).dark],
                    onChange: (p0) {},
                  ),
                )
              ],
            ),
            12.ph,
            Row(
              children: [
                Icon(
                  Icons.headset_mic,
                  color: Colors.green,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).support,
                  style: Styles.textStyle18SemiBold,
                ),
              ],
            ),
            20.ph,
            Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).deleteAccount,
                  style: Styles.textStyle18SemiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
