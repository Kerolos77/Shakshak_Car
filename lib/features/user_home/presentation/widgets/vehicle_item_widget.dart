import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';

class VehicleItemWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleItemWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color:
              isSelected ? AppColors.primaryColor : AppColors.primaryLightColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50.r,
                ),
              ),
            ),
            6.ph,
            Text(
              'Ride',
              style: Styles.textStyle16.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
