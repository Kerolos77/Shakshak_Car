import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';

import 'drive_details_card.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map,
                size: 100.r,
                color: Colors.grey[400],
              ),
              12.ph,
              Text(
                'Map Placeholder',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 16.w,
          right: 16.w,
          child: DriveDetailsCard(),
        ),
      ],
    );
  }
}
