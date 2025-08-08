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

import '../../../../../core/utils/common_use.dart';
import '../../../../../generated/l10n.dart';
import '../../../outstation/presentation/widgets/ride_destination_widget.dart';

class NewDriverRides extends StatelessWidget {
  const NewDriverRides({
    super.key,
  });


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
            color: Colors.white,
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
                        'Mostafa',
                        style: Styles.textStyle16SemiBold,
                      ),
                      Text(
                        '50.00 EGP',
                        style: Styles.textStyle16SemiBold,
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
                      '0.79 KM',
                      style: Styles.textStyle14SemiBold
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(),
            RideDestinationWidget(
              from: 'Shebeen El-kom',
              to: 'Shebeen El-kom',
            ),
            // 12.ph,
            // Container(
            //   padding:
            //   EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            //   decoration: BoxDecoration(
            //     color: AppColors.lightGreyColor,
            //     borderRadius: BorderRadius.circular(8.r),
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         '${S.of(context).status}: ',
            //         style: Styles.textStyle16Bold,
            //       ),
            //       Text(
            //         'Completed',
            //         style: Styles.textStyle16,
            //       ),
            //     ],
            //   ),
            // ),
            12.ph,
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              //   decoration: BoxDecoration(
              //     color: AppColors.lightGreyColor,
              //     borderRadius: BorderRadius.circular(12.r),
              //   ),
              //   child: Text(
              //     'Recommended price is 50.00 EGP , Approx distance 3.03 KM',
              //     style: Styles.textStyle16,
              //   ),
              // ),
              CustomButton(
                text: 'Accept Ride (50.00 EGP)',
                onTap: () {

                },
                height: 40.h,
                borderRadius: 8.r,
                // img: Icon(
                //   Icons.call,
                //   color: Colors.white,
                //   size: 26.r,
                // ),
              ),
            12.ph,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
              // scrollDirection:  Axis.,

              itemCount: 3,
                shrinkWrap: true,
                itemBuilder:  (context, index) {
                  return CustomButton(
                    text: '+ 20 EGP',
                    onTap: () {

                    },
                    height: 40.h,
                    borderRadius: 8.r,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
