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
    required this.phoneNumber,
  });

  final TextEditingController otpController;
  final GlobalKey<FormState> formKey;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerifyPhoneOTPSuccessState) {
          if (state.profileModel.status == 200) {
            showSnackBar(
                context,
                state.profileModel.msg!,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
            if (state.profileModel.data?.id != null) {
              CacheHelper.saveData(
                  key: AppConstant.kUserIdOtp,
                  value: state.profileModel.data?.id);
              if(state.profileModel.data?.driverStatus == "0"){
                navigateTo(context, Routes.userHomeView);
              }else{
                navigateTo(context, Routes.driverHomeView);
              }
            }
            else {
            navigateTo(context, Routes.registerView,extra:{"phoneNumber":phoneNumber});
          }
          } else {
            showSnackBar(
                context,
                state.profileModel.msg!,
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


                 if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().verifyPhoneOtp(
                      otpCode: int.parse(otpController.text),
                    );
              }
            },
          );
        } else {
          return const CustomLoadingButton();
        }
      },
    );
  }
}
