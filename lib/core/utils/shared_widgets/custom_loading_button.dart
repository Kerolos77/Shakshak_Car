import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_const.dart';
import '../../resources/app_colors.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton(
      {super.key,
      this.color = AppColors.secondaryColor,
      this.circleIndicatorColor = AppColors.secondaryColor,
      this.height = 56});

  final Color color;
  final Color circleIndicatorColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        boxShadow: AppConstant.shadow,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
