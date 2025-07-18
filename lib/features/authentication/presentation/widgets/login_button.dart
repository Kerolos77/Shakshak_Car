import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/features/authentication/presentation/view_models/auth_cubit/auth_cubit.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_loading_button.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/login_body.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailOrPhoneController,
    // required this.countryCode,
    required this.formKey,
  });

  final TextEditingController emailOrPhoneController;

  // final String countryCode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.userModel.statusval == true) {
            showSnackBar(
                context,
                state.userModel.msg ?? '',
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
            navigateTo(context, Routes.otpView, extra: {
              "phoneNumber": emailOrPhoneController.text,
            });
          } else {
            showSnackBar(
                context,
                state.userModel.msg ?? '',
                S.of(context).errorOccurred,
                AppColors.redColor,
                ContentType.failure);
          }
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const CustomLoadingButton();
        } else {
          return CustomButton(
            text: S.of(context).next,
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().login(
                      loginBody: LoginBody(
                        phone: context.read<AuthCubit>().completeNumber,
                      ),
                    );
              }
            },
          );
        }
      },
    );
  }
}
