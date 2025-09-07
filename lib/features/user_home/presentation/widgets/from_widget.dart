import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class FromWidget extends StatelessWidget {
  const FromWidget({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        // vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 10.r,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 5.r,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Text(
              address,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
