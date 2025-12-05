import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/common_use.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../rides/data/models/ride.dart';

class DriveDetailsCard extends StatelessWidget {
  const DriveDetailsCard({
    super.key,
    this.onTap,
    required this.ride,
  });

  final void Function()? onTap;
  final Ride ride;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(
              20.r,
            ),
            border: Border.all(color: AppColors.primaryColor, width: 2)),
        child: Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 35.r,
                  ),
                ),
                12.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ride.user?.name ?? '',
                      style: Styles.textStyle18Bold(context),
                    ),
                    Text(
                      '${ride.amount ?? ''} جنيه',
                      style: Styles.textStyle18Bold(context),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 28.r,
                ),
                onPressed: () {
                  navigateTo(context, Routes.chatView);
                },
              ),
            ),
            16.pw,
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 28.r,
                ),
                onPressed: () {
                  makePhoneCall(phoneNumber: '+201000000000');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
