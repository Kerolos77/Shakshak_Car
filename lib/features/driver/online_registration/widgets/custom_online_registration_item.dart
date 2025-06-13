import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/utils/styles.dart';


class CustomOnlineRegistrationItem extends StatelessWidget {
  const CustomOnlineRegistrationItem({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Styles.textStyle16.copyWith(color: Colors.white),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 32.r,
            )
          ],
        ),
      ),
    );
  }
}
