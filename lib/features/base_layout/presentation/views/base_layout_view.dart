import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_app_bar.dart';

import '../widgets/custom_drawer.dart';

class BaseLayoutView extends StatelessWidget {
  const BaseLayoutView({
    super.key,
    this.header,
    this.body,
    this.title,
    this.horizontalPadding = 16,
  });

  final Widget? header;
  final Widget? body;
  final String? title;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Theme.of(context).primaryColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              40.ph,
              CustomAppBar(title: title),
              header ?? SizedBox.shrink(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 16.h,
                      left: horizontalPadding.w,
                      right: horizontalPadding.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          20.r,
                        ),
                      )),
                  child: body,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
