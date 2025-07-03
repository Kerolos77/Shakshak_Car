import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/utils/shared_widgets/phone_text_field.dart';
import 'package:shakshak/generated/assets.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/l10n.dart';
import 'login_button.dart';
import 'terms_and_conditions_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          80.ph,
          /*Container(
            height: 300.h,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(100.r),
                )),
          ),*/
          Center(
            child: SvgPicture.asset(
              Assets.svgLogin,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          50.ph,
          Text(
            S.of(context).login,
            style: Styles.textStyle20Bold,
          ),
          Text(
            S.of(context).welcomeBack,
            style: Styles.textStyle16,
          ),
          30.ph,
          Form(
            key: formKey,
            child: Column(
              children: [
                PhoneTextField(
                  controller: phoneController,
                ),
                14.ph,
                LoginButton(
                  emailOrPhoneController: phoneController,
                  formKey: formKey,
                ),
                14.ph,
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).noAccount,
                        style: Styles.textStyle14.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, Routes.registerView);
                        },
                        child: Text(
                          S.of(context).signup,
                          style: Styles.textStyle14SemiBold.copyWith(
                            color: AppColors.darkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                14.ph,
                TermsAndConditionsWidget(),
              ],
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: 16.w,
      ),
    );
  }
}
