import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_loading_button.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_models/auth_cubit/auth_cubit.dart';

class OtpButton extends StatelessWidget {
  const OtpButton({
    super.key,
    required this.otpController,
    required this.formKey,
  });

  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyPhoneOTPSuccessState) {
          if (state.userModel.status == true) {
            showSnackBar(
                context,
                state.userModel.message!,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
            if (state.userModel.data?.userId != null &&
                state.userModel.data?.userId != "") {
              CacheHelper.saveData(
                  key: AppConstant.kUserIdOtp,
                  value: state.userModel.data?.userId);
            }
            navigateAndFinish(context, Routes.loginView);
          } else {
            showSnackBar(
                context,
                state.userModel.message!,
                S.of(context).errorOccurred,
                AppColors.redColor,
                ContentType.failure);
          }
        }
      },
      builder: (context, state) {
        if (state is! VerifyPhoneOTPLoadingState) {
          return CustomButton(
            text: S.of(context).activate,
            onTap: () {
              navigateTo(context, Routes.registerView);

              /*   if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().verifyPhoneOtp(
                      otpCode: int.parse(otpController.text),
                    );
              }*/
            },
          );
        } else {
          return const CustomLoadingButton();
        }
      },
    );
  }
}
