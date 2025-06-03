import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/styles.dart';

class FaqItem extends StatefulWidget {
  const FaqItem({super.key});

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  final ExpandableController expandableController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      header: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppConstant.shadow,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'How can i pay ?',
                  style: Styles.textStyle16SemiBold,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expandableController.expanded =
                          !expandableController.expanded;
                    });
                  },
                  icon: Icon(
                    expandableController.expanded == false
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      collapsed: SizedBox(),
      expanded: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10.h,
            ),
            padding: EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppConstant.shadow,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse vel justo vitae justo faucibus tincidunt.Maecenas aliquet, nisi at varius consequat, urna lorem fermentum est.Curabitur vel elit ac nulla dapibus sollicitudin.Praesent in orci nec risus tincidunt tincidunt.Integer tincidunt, lacus a pulvinar laoreet, nulla velit fermentum mi, nec viverra erat purus eget quam.Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.',
                style: Styles.textStyle16SemiBold
                    .copyWith(color: AppColors.greyColor),
              ),
            ),
          ),
          8.ph,
        ],
      ).paddingSymmetric(horizontal: 12.w),
      theme: ExpandableThemeData(
        hasIcon: false,
        iconColor: AppColors.primaryColor,
        tapBodyToExpand: false,
        tapBodyToCollapse: false,
        tapHeaderToExpand: false,
        iconSize: 26.r,
      ),
    );
  }
}
