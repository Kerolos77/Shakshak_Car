import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_divider.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../../../generated/l10n.dart';
import '../../../../rides/data/models/ride.dart';
import '../../../new_rides/data/models/ride_model.dart';
import '../../../outstation/presentation/widgets/ride_destination_widget.dart';

class TripMapDetailsItem extends StatefulWidget {
  const TripMapDetailsItem({super.key,required this.ride});
final Ride ride;
  @override
  State<TripMapDetailsItem> createState() => _TripMapDetailsItemState();
}

class _TripMapDetailsItemState extends State<TripMapDetailsItem> {
  final ExpandableController expandableController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      theme: ExpandableThemeData(
        hasIcon: false,
        iconColor: AppColors.primaryColor,
        tapBodyToExpand: false,
        tapBodyToCollapse: false,
        tapHeaderToExpand: false,
        iconSize: 26.r,
      ),
      expanded: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            boxShadow: AppConstant.shadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  expandableController.expanded =
                      !expandableController.expanded;
                });
              },
              icon: Icon(
                expandableController.expanded == false
                    ? Icons.keyboard_double_arrow_down
                    : Icons.keyboard_double_arrow_up,
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      widget.ride.user!.name!,
                        style: Styles.textStyle16SemiBold(context),
                      ),
                      Text(
                        '${widget.ride.amount} EGP',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                    ],
                  ),
                ),
                12.pw,
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.black,
                      size: 16.r,
                    ),
                    4.pw,
                    Text(
                      '${widget.ride.distance.toString()} ${widget.ride.distanceType}',
                      style: Styles.textStyle14SemiBold(context)
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            12.ph,
          ],
        ),
      ),
      collapsed: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            boxShadow: AppConstant.shadow,
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  expandableController.expanded =
                      !expandableController.expanded;
                });
              },
              icon: Icon(
                expandableController.expanded == false
                    ? Icons.keyboard_double_arrow_down
                    : Icons.keyboard_double_arrow_up,
                color: AppColors.primaryColor,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ride.user!.name!,
                        style: Styles.textStyle16SemiBold(context),
                      ),
                      Text(
                        '${widget.ride.amount} EGP',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                    ],
                  ),
                ),
                12.pw,
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.black,
                      size: 16.r,
                    ),
                    4.pw,
                    Text(
                      '${widget.ride.distance} ${widget.ride.distanceType}',
                      style: Styles.textStyle14SemiBold(context)
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(),
            RideDestinationWidget(
              from: widget.ride.sourceAddress!,
              to:  widget.ride.destinationAddress!,
            ),
            12.ph,
            SizedBox(
              height: 60.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                        50.r,
                      )),
                  child: Center(
                      child: Text(
                    '+5',
                    style: Styles.textStyle20Bold(context).copyWith(color: Colors.white),
                  )),
                ),
                separatorBuilder: (context, index) => 8.pw,
              ),
            ),
            20.ph,
            CustomButton(
              text: S.of(context).acceptFareOn('${widget.ride.amount} EGP'),
              onTap: () {},
            ),
            12.ph,
          ],
        ),
      ),
    );
  }
}
