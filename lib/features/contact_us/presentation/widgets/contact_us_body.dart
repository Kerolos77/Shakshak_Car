import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/generated/l10n.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: Row(
            children: [
              Icon(
                Icons.call,
                color: Colors.black,
                size: 26.r,
              ),
              6.pw,
              Text(
                S.of(context).call,
                style: Styles.textStyle18Bold,
              )
            ],
          ).paddingSymmetric(horizontal: 8.w, vertical: 4.h),
        ),
        Divider(),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.black,
                size: 26.r,
              ),
              6.pw,
              Text(
                S.of(context).location,
                style: Styles.textStyle18Bold,
              )
            ],
          ).paddingSymmetric(horizontal: 8.w, vertical: 4.h),
        ),
      ],
    );
  }
}
