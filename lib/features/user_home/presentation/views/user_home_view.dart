import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/router/routes.dart';
import '../../../../generated/l10n.dart';
import '../widgets/captions_widget.dart';
import '../widgets/select_vehicle_section.dart';
import '../widgets/user_home_header.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      header: const UserHomeHeader(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).whereYouWantToGo,
              style: Styles.textStyle20Bold(context),
            ),
            6.ph,
            CaptionsWidget(),
            20.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 24.r,
                      width: 24.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                    SizedBox(height: 50.h, child: const VerticalDivider()),
                    Container(
                      height: 24.r,
                      width: 24.r,
                      padding: EdgeInsets.all(1.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(Icons.place, color: Colors.white, size: 16.r),
                    ),
                  ],
                ),
                12.pw,
                Expanded(
                  child: Column(
                    children: [
                      CustomTextField(hint: S.of(context).pickupLocation),
                      12.ph,
                      CustomTextField(hint: S.of(context).dropoffLocation),
                    ],
                  ),
                ),
              ],
            ),
            20.ph,
            const SelectVehicleSection(),
            20.ph,
            CustomTextField(hint: S.of(context).enterOfferRate),
            20.ph,
            CustomDropDown(
              items: [S.of(context).cash, S.of(context).wallet],
              onChange: (method) {
                // handle method change
              },
              hint: S.of(context).selectPaymentMethod,
            ),
            20.ph,
            CustomButton(
              text: S.of(context).bookRide,
              onTap: () {
                navigateTo(context, Routes.offersView);
              },
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}
