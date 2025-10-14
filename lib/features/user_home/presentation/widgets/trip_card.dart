import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../../generated/l10n.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: AppConstant.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).searching,
                style: Styles.textStyle18SemiBold(context),
              ),
              Text(
                '60.00 جنيه',
                style: Styles.textStyle18Bold(context),
              ),
            ],
          ),
          12.ph,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 24.r,
                    width: 24.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                  8.pw,
                  Expanded(
                    child: Text(
                      'Al Khosous 28 Hebeesh',
                      style: Styles.textStyle16Medium(context),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 20.h,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: const VerticalDivider()),
              Row(
                children: [
                  Container(
                    height: 24.r,
                    width: 24.r,
                    padding: EdgeInsets.all(1.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Icon(Icons.place, color: Colors.white, size: 16.r),
                  ),
                  8.pw,
                  Expanded(
                    child: Text(
                      'Haret Masged Al Ain Shams Sharkeya',
                      style: Styles.textStyle16Medium(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          12.ph,
          CustomButton(
            text: S.of(context).cancel,
            height: 40,
            borderRadius: 8,
          ),
        ],
      ),
    );
  }
}
