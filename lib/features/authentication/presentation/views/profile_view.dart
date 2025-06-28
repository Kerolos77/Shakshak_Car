import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/validations.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/utils/shared_widgets/custom_drop_down.dart';
import '../../../../core/utils/shared_widgets/phone_text_field.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).profile,
      header: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 60.r,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100.r,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  child: Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 26.r,
                  ),
                ),
              ],
            ),
          ),
          20.ph,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              // controller: userNameController,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: Validation.validateName(context),
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgUser),
              ),
              hint: S.of(context).userName,
            ),
            12.ph,
            PhoneTextField(),
            12.ph,
            CustomTextField(
              // controller: emailController,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: Validation.validateEmail(context),
              keyType: TextInputType.emailAddress,
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgEmail),
              ),
              hint: S.of(context).email,
            ),
            12.ph,
            CustomDropDown(
              items: [
                'a',
                'b',
                'c',
              ],
              onChange: (p0) {},
              hint: S.of(context).chooseLocation,
              prefix: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(Assets.svgLocation),
              ),
            ),
            20.ph,
            CustomButton(text: 'Update profile'),
            20.ph
          ],
        ),
      ),
    );
  }
}
