import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';

class OutstationRidesListItem extends StatelessWidget {
  const OutstationRidesListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: AppConstant.shadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Canceled',
                style: Styles.textStyle16SemiBold,
              ),
              Text(
                '50.00 EGP',
                style: Styles.textStyle18Bold,
              ),
            ],
          ),
          8.ph,
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 24.r,
                    width: 24.r,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 30.h, child: VerticalDivider()),
                  Container(
                    height: 24.r,
                    width: 24.r,
                    padding: EdgeInsets.all(1.r),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.place,
                      color: Colors.white,
                      size: 16.r,
                    ),
                  ),
                ],
              ),
              12.pw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shebeen El-kom',
                      style: Styles.textStyle16Medium,
                    ),
                    30.ph,
                    Text(
                      'Shebeen El-kom',
                      style: Styles.textStyle16SemiBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          10.ph,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(12.r)),
            child: Text(
              'canceled',
              style: Styles.textStyle16SemiBold,
            ),
          ),
          10.ph,
        ],
      ),
    );
  }
}
