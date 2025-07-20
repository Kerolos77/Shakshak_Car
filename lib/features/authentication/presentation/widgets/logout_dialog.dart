import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/shared_widgets/custom_animated_dialog.dart';
import '../../../../core/utils/shared_widgets/custom_button.dart';
import '../../../../core/utils/shared_widgets/show_snack_bar.dart';
import '../../../../core/utils/styles.dart';
import '../../../../generated/l10n.dart';
import '../view_models/auth_cubit/auth_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(sl<AuthRepo>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CustomAnimatedDialog(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Text(
                  S.of(context).logoutConfirmation,
                  style: Styles.textStyle16Medium(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  text: S.of(context).logout,
                  onTap: () {
                    context.read<AuthCubit>().logout();
                    showSnackBar(
                        context,
                        S.of(context).logoutSuccessMessage,
                        S.of(context).doneSuccessfully,
                        AppColors.secondaryColor,
                        ContentType.success);
                    navigateAndFinish(context, Routes.loginView);
                  },
                ),
                TextButton(
                  onPressed: () => navigatePop(context),
                  child: Text(
                    S.of(context).close,
                    style: Styles.textStyle12SemiBold(context).copyWith(
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
