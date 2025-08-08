import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/generated/l10n.dart';

class UserHomeHeader extends StatelessWidget {
  const UserHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mostafa',
          style: Styles.textStyle20Bold(context).copyWith(
            color: Colors.white,
          ),
        ),
        6.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.place,
              color: Colors.white,
              size: 26.r,
            ),
            8.pw,
            Expanded(
              child: Text(
                '${S.of(context).welcomeBack} Mostafa!\n${S.of(context).helloToOurApp}',
                style: Styles.textStyle16(context).copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        16.ph,
      ],
    ).paddingSymmetric(horizontal: 16.w);
  }
}
