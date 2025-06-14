import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../driver/outstation/presentation/widgets/ride_destination_widget.dart';

class RidesListItem extends StatelessWidget {
  const RidesListItem({
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
          RideDestinationWidget(
            from: 'Shebeen El-kom',
            to: 'Shebeen El-kom',
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
