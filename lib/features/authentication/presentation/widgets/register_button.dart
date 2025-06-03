import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/router/router_helper.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_loading_button.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../view_models/auth_cubit/auth_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    // required this.countryCode,
    required this.formKey,
    required this.passwordController,
  });

  final TextEditingController userNameController,
      emailController,
      phoneController,
      passwordController;

  // final String countryCode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.userModel.status == true) {
            showSnackBar(
                context,
                state.userModel.message!,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
            if (state.userModel.data?.token != null &&
                state.userModel.data?.token != "") {
              AppConstant.otp = state.userModel.data?.token;
              CacheHelper.saveData(
                  key: AppConstant.kRegisterToken,
                  value: state.userModel.data?.token);
            }
          } else {
            showSnackBar(
              context,
              state.userModel.message!,
              S.of(context).errorOccurred,
              AppColors.redColor,
              ContentType.failure,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is! RegisterLoadingState) {
          return CustomButton(
            text: S.of(context).signup,
            onTap: () {
              navigateTo(context, Routes.userHomeView);
              /*       if (formKey.currentState!.validate()) {

                  context.read<AuthCubit>().signup(
                    signupBody: SignupBody(
                      userName: userNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      password: passwordController.text,
                      roleId: CacheHelper.getData(
                          key: AppConstant.kRoleSelection),
                    ),
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
