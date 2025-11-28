import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/generated/assets.dart';

import '../../../../core/utils/shared_widgets/phone_text_field.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/l10n.dart';
import '../view_models/auth_cubit/auth_cubit.dart';
import 'login_button.dart';
import 'terms_and_conditions_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // phoneController.dispose();
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
            style: Styles.textStyle20Bold(context),
          ),
          Text(
            S.of(context).welcomeBack,
            style: Styles.textStyle16(context),
          ),
          30.ph,
          Form(
            key: formKey,
            child: Column(
              children: [
                // CustomTextField(
                //   controller: phoneController,
                //   autoValidateMode: AutovalidateMode.onUserInteraction,
                //   validator: Validation.validatePhone(context),
                //   keyType: TextInputType.phone,
                //   prefix: Padding(
                //     padding: EdgeInsets.all(8.r),
                //     child: SvgPicture.asset(Assets.svgPhone),
                //   ),
                //   hint: S.of(context).mobileNumber,
                // ),
                PhoneTextField(
                  controller: context.read<AuthCubit>().phoneController,
                ),
                24.ph,
                LoginButton(
                  emailOrPhoneController:
                      context.read<AuthCubit>().phoneController,
                  formKey: formKey,
                ),
                14.ph,
                // Align(
                //   alignment: Alignment.center,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         S.of(context).noAccount,
                //         style: Styles.textStyle14(context).copyWith(
                //           color: AppColors.primaryColor,
                //         ),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           navigateTo(context, Routes.registerView);
                //         },
                //         child: Text(
                //           S.of(context).signup,
                //           style: Styles.textStyle14SemiBold(context).copyWith(
                //             color: AppColors.darkGreyColor,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
