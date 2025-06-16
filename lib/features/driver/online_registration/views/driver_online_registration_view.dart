import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../widgets/custom_online_registration_item.dart';

class DriverOnlineRegistrationView extends StatefulWidget {
  const DriverOnlineRegistrationView({super.key});

  @override
  State<DriverOnlineRegistrationView> createState() =>
      _DriverOnlineRegistrationViewState();
}

class _DriverOnlineRegistrationViewState
    extends State<DriverOnlineRegistrationView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).onlineRegistration,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              hint: S.of(context).nationalIdBirthDate,
              isReadOnly: true,
              suffix: Icon(
                Icons.calendar_month,
                color: AppColors.darkGreyColor,
                size: 26.r,
              ),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  _controller.text =
                      pickedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
            18.ph,
            CustomOnlineRegistrationItem(
              title: S.of(context).criminalRecord,
              onTap: () {
                navigateTo(context, Routes.criminalRecordView);
              },
            ),
            18.ph,
            CustomOnlineRegistrationItem(
              title: S.of(context).nationalId,
              onTap: () {
                navigateTo(context, Routes.nationalIdView);
              },
            ),
            18.ph,
            CustomOnlineRegistrationItem(
              title: S.of(context).licence,
              onTap: () {
                navigateTo(context, Routes.licenceView);
              },
            ),
            18.ph,
            CustomOnlineRegistrationItem(
              title: S.of(context).carLicence,
              onTap: () {
                navigateTo(context, Routes.carLicenceView);
              },
            ),
            18.ph,
            CustomOnlineRegistrationItem(
              title: S.of(context).car,
              onTap: () {
                navigateTo(context, Routes.carView);
              },
            ),
            30.ph,
            CustomButton(text: S.of(context).sendDocs),
            18.ph,
          ],
        ),
      ),
    );
  }
}
