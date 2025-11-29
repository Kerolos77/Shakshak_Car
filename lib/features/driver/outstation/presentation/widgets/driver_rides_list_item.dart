import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_divider.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';

import '../../../../../core/utils/common_use.dart';
import '../../../../../generated/l10n.dart';
import 'ride_destination_widget.dart';

class DriverRidesListItem extends StatelessWidget {
  const DriverRidesListItem({
    super.key,
    required this.ride,
    this.isOutstation = false,
  });

  final Ride ride;
  final bool isOutstation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, Routes.tripMapView);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            boxShadow: AppConstant.shadow,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          children: [
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
                        ride.user?.name ?? '-',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                      Text(
                        '${ride.amount ?? '-'} EGP',
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
                      '${ride.distance ?? '-'} KM',
                      style: Styles.textStyle14SemiBold(context)
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(),
            RideDestinationWidget(
              from: ride.sourceAddress ?? '-',
              to: ride.destinationAddress ?? '-',
            ),
            12.ph,
            isOutstation
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).weight} ${ride.parcelWeight ?? '-'} KG',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                      Text(
                        '${S.of(context).dimension} ${ride.parcelDimension ?? '-'}',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                      Text(
                        '${S.of(context).image} ${ride.parcelImage ?? '-'}',
                        style: Styles.textStyle16SemiBold(context),
                      ),
                    ],
                  )
                : Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${S.of(context).status}: ',
                          style: Styles.textStyle16Bold(context),
                        ),
                        Text(
                          ride.status ?? '-',
                          style: Styles.textStyle16(context),
                        ),
                      ],
                    ),
                  ),
            12.ph,
            if (isOutstation)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Recommended price is ${ride.amount ?? '-'} EGP , Approx distance ${ride.distance ?? '-'} KM',
                  style: Styles.textStyle16(context),
                ),
              ),
            if (!isOutstation)
              CustomButton(
                text: '',
                onTap: () {
                  if (ride.user?.phone != null) {
                    makePhoneCall(
                      phoneNumber: ride.user!.phone!,
                    );
                  }
                },
                height: 40,
                borderRadius: 8,
                img: Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 26.r,
                ),
              )
          ],
        ),
      ),
    );
  }
}
