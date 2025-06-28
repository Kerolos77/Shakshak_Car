import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';

import '../../../../core/resources/app_colors.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key, required this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonColor: AppColors.primaryColor,
        height: 45.h,
        borderRadius: 18.r,
        onTap: onPressed,
        text: 'save');
  }
}
