import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/shared_widgets/custom_animated_dialog.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/styles.dart';
import '../view_models/auth_cubit/auth_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepo>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        /*       buildWhen: (previous, current) =>
            current is LogoutLoadingState ||
            current is LogoutSuccessState ||
            current is LogoutFailureState,*/
        listener: (context, state) {
          /* if (state is LogoutSuccessState) {
            showSnackBar(
                context,
                state.logoutModel.message ?? 'تم تسجيل خروجك بنجاح',
                'تم بنجاح',
                AppColors.secondaryColor,
                ContentType.success);
            navigateAndFinish(context, Routes.loginView);
          } else if (state is LogoutFailureState) {
            showSnackBar(context, state.errorMessage, 'حدث خطأ',
                AppColors.redColor, ContentType.failure);
          }*/
        },
        builder: (context, state) {
          return ModalProgressHUD(
            // inAsyncCall: state is LogoutLoadingState ? true : false,
            inAsyncCall: false,
            opacity: 0.5,
            progressIndicator: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            child: CustomAnimatedDialog(
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'هل أنت متأكد إنك تريد تسجيل الخروج ؟',
                    style: Styles.textStyle16Medium
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CustomButton(
                    text: 'تسجيل الخروج',
                    onTap: () {
                      context.read<AuthCubit>().logout();
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        navigatePop(context);
                      },
                      child: Text(
                        'إغلاق',
                        style: Styles.textStyle12SemiBold
                            .copyWith(color: Colors.grey),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
