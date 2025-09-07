import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/converts.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_divider.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';

import '../../../../../core/utils/common_use.dart';
import '../../../../../generated/l10n.dart';
import '../../../new_rides/data/models/ride_model.dart';
import 'ride_destination_widget.dart';

class DriverRidesListItem extends StatelessWidget {
   DriverRidesListItem({
    super.key,
    required this.ride,
    this.isOutstation = false,
    this.isNew = false,
     // this.ride,
  });

  final Ride ride;
  final bool isOutstation;
  final bool isNew;
  // RideModel? ride;
   RideModel testRide = RideModel.fromJson(
      {
        "id": 742,
        "destination_lat": "24.9534",
        "destination_long": "24.9534",
        "destination_address": "Airport Terminal 1",
        "source_lat": "24.7136",
        "source_long": "46.6753",
        "source_address": "Royal Hotel",
        "amount": "120.000",
        "final_rate": "0.000",
        "distance": "14",
        "distance_type": "km",
        "status": "searching",
        "offerdriver": "",
        "is_offer": "1",
        "created_at": "2025-07-31 21:51:21",
        "driver":{
          "id": 51,
          "name": "ii",
          "phone": "+201225536605",
          "image": "",
          "country_id": 64,
          "city": 1881,
          "email": "kokofaie7@gmail.com",
          "wallet_amount": "-330.00",
          "pending_wallet": "330.000",
          "driver_status": "",
          "is_driver": 0,
          "is_online": 0,
          "service_id": 0},
        "user": {
          "id": 51,
          "name": "ii",
          "phone": "+201225536605",
          "image": "",
          "country_id": 64,
          "city": 1881,
          "email": "kokofaie7@gmail.com",
          "wallet_amount": "-330.00",
          "pending_wallet": "330.000",
          "driver_status": "",
          "is_driver": 0,
          "is_online": 0,
          "service_id": 0
        },
        "when_date": "",
        "inter_city": 1,
        "user_service_id": "4",
        "paid": 0,
        "payment_type": "cash",
        "commission": "",
        "destination_City": "",
        "source_city": "",
        "parcel_dimension": "",
        "parcel_image": "",
        "parcel_weight": "",
        "number_of_passenger": 4,
        "is_placed": "",
        "is_started": "",
        "is_accept": "",
        "is_complete": "",
        "is_canceled": "",
        "canceled_by": 0,
        "comment": "",
        "service_type": "ride"
      }
  );

  @override
  Widget build(BuildContext context) {
    // ride ??= testRide;
    return GestureDetector(
      onTap: () {
        navigateTo(context, Routes.tripMapView,extra: {
          'ride':ride,
        });
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
                ? Column(
                  children: [
                    Row(
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

                        ],
                      ),
                    Image.network(
                      ride.parcelImage ?? '',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          FontAwesomeIcons.image,
                          size: 50.r,
                          color: AppColors.lightGreyColor,
                        );
                        
                      },
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
              ),
            if (!isNew)
            Column(
              children: [
                isOutstation
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${S.of(context).weight} ${ride!.parcelWeight} KG',
                      style: Styles.textStyle16SemiBold(context),
                    ),
                    Text(
                      '${S.of(context).dimension} ${ride!.parcelDimension} CM',
                      style: Styles.textStyle16SemiBold(context),
                    ),
                    Text(
                      '${S.of(context).image} ${ride!.parcelImage}',
                      style: Styles.textStyle16SemiBold(context),
                    ),
                  ],
                )
                    : Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${S.of(context).status}: ',
                        style: Styles.textStyle16Bold(context),
                      ),
                      Text(
                        ride.status!,
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
                      'Recommended price is ${ride.amount} EGP , Approx distance ${ride.distance} ${ride.distanceType}',

                      style: Styles.textStyle16(context),
                    ),
                  ),
                if (!isOutstation)
                  CustomButton(
                    text: '',
                    onTap: () {
                      makePhoneCall(
                        phoneNumber: ride.user!.phone!,
                      );
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
            )
          ],
        ),
      ),
    );
  }
}
