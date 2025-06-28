import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/resources/app_colors.dart';

class HeaderOfPlaceWidget extends StatelessWidget {
  const HeaderOfPlaceWidget({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryColor,
      ),
      width: 170.w,
      height: 38.h,
      child: Center(
        child: Text(
          header,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 13.2.sp),
        ),
      ),
    );
  }
}
