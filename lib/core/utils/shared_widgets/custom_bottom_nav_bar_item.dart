import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';
import '../styles.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.index,
      required this.currentIndex});
  final String title, icon;
  final int index, currentIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          width: 25.r,
          height: 25.r,
        ),
        Text(
          title,
          style: Styles.textStyle14Medium.copyWith(
              color: index == currentIndex
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.5)),
        )
      ],
    );
  }
}
