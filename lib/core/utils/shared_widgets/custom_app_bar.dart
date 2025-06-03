import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.sort,
              color: Colors.white,
              size: 40.r,
            )),
        Text(
          title ?? '',
          style: Styles.textStyle20Bold.copyWith(color: Colors.white),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20.r,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 32.r,
          ),
        ).paddingSymmetric(
          horizontal: 12.w,
        )
      ],
    ).paddingSymmetric(
      horizontal: 4.w,
    );
  }
}
