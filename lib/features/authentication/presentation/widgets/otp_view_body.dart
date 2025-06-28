import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/generated/assets.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/validations.dart';
import '../../../../generated/l10n.dart';
import 'otp_button.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({
    super.key,
    required this.phoneNumber,
  });
final String phoneNumber;
  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: MediaQuery.sizeOf(context).width / 5,
      height: 56.h,
      textStyle: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          decoration: TextDecoration.underline),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.borderColor),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.ph,
          Center(
            child: SvgPicture.asset(
              Assets.svgLogin,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          60.ph,
          Text(
            S.of(context).enterTheCodeSentToYourPhone,
            style:
                Styles.textStyle14Bold.copyWith(color: AppColors.primaryColor),
          ),
          50.ph,
          Form(
            key: formKey,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: otpController,
                length: 6,
                obscureText: true,
                // keyboardType: TextInputType.text,
                validator: Validation.validateOTP(context),
                obscuringWidget: CircleAvatar(
                  backgroundColor: AppColors.borderColor,
                  radius: 7.r,
                ),
                onCompleted: (value) {
                  debugPrint(otpController.text);
                },
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme,
              ),
            ),
          ),
          85.ph,
          OtpButton(
            otpController: otpController,
            formKey: formKey,
            phoneNumber:widget.phoneNumber ,
          ),
          14.ph,
          /*   ResendOtp(),*/
        ],
      ).paddingSymmetric(
        horizontal: 16.w,
      ),
    );
  }
}
