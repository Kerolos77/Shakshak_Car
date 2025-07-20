import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../generated/l10n.dart';
import '../view_models/language_cubit/language_cubit.dart';
import '../view_models/theme_cubit/theme_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      title: S.of(context).settings,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.translate,
                  color: AppColors.primaryColor,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).language,
                  style: Styles.textStyle18SemiBold(context),
                ),
                10.pw,
                Spacer(),
                BlocBuilder<LanguageCubit, LanguageState>(
                  buildWhen: (previous, current) =>
                      current is LanguageChangeLangState,
                  builder: (context, state) {
                    var cubit = context.read<LanguageCubit>();

                    return SizedBox(
                      width: 150.w,
                      child: CustomDropDown(
                        items: const ['العربية', 'English'],
                        value: CacheHelper.getData(
                                  key: AppConstant.kCurrentLanguage,
                                ) ==
                                'ar'
                            ? 'العربية'
                            : 'English',
                        onChange: (selectedLanguage) {
                          String languageCode =
                              selectedLanguage == 'العربية' ? 'ar' : 'en';
                          cubit.changeLanguage(languageCode: languageCode);
                          CacheHelper.saveData(
                              key: AppConstant.kCurrentLanguage,
                              value: languageCode);
                        },
                      ),
                    );
                  },
                )
              ],
            ),
            12.ph,
            Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: AppColors.darkGreyColor,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).lightDarkTheme,
                  style: Styles.textStyle18SemiBold(context),
                ),
                10.pw,
                Spacer(),
                SizedBox(
                  width: 150.w,
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      final themeCubit = context.read<ThemeCubit>();
                      final isDark = themeState.themeMode == AppThemeMode.dark;
                      return CustomDropDown(
                        items: [S.of(context).light, S.of(context).dark],
                        value: isDark ? S.of(context).dark : S.of(context).light,
                        onChange: (selected) {
                          final mode = selected == S.of(context).dark
                              ? AppThemeMode.dark
                              : AppThemeMode.light;
                          themeCubit.changeTheme(mode);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
            12.ph,
            Row(
              children: [
                Icon(
                  Icons.headset_mic,
                  color: Colors.green,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).support,
                  style: Styles.textStyle18SemiBold(context),
                ),
              ],
            ),
            20.ph,
            Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32.r,
                ),
                10.pw,
                Text(
                  S.of(context).deleteAccount,
                  style: Styles.textStyle18SemiBold(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
