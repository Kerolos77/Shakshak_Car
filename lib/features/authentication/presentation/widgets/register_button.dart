import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/features/authentication/presentation/view_models/country_city_cubit/countries_cities_cubit.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/custom_loading_button.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/signup_body.dart';
import '../view_models/auth_cubit/auth_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    required this.formKey,
  });

  final TextEditingController userNameController,
      emailController,
      phoneController;

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.userModel.statusval == true) {
            showSnackBar(
                context,
                // state.userModel.msg ?? '',
                S.of(context).accountRegisteredSuccessfully,
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
            navigateAndReplacement(context, Routes.loginView);
          } else {
            showSnackBar(
              context,
              state.userModel.msg ?? '',
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
              if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().signup(
                      signupBody: SignupBody(
                        userName: userNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        countryId: context
                                .read<CountriesCitiesCubit>()
                                .selectedCountryId ??
                            0,
                        cityId: context
                                .read<CountriesCitiesCubit>()
                                .selectedCityId ??
                            0,
                      ),
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
