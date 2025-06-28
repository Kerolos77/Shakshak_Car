import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class WriteCommentWidget extends StatelessWidget {
  const WriteCommentWidget(
      {super.key, required this.onTap, required this.commentController});

  final Function()? onTap;
  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        style: TextStyle(
          fontSize: 14.sp,
        ),
        // تحديد حجم الخط
        controller: commentController,
        readOnly: true,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: '...Write your comment here...',
          hintStyle: const TextStyle(),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          labelStyle: const TextStyle(color: AppColors.blackColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blackColor),
            borderRadius: BorderRadius.all(
              Radius.circular(18.r),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
