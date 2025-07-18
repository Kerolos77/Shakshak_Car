import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/router/app_router.dart';

import 'core/constants/app_const.dart';
import 'core/network/dio_helper/dio_helper.dart';
import 'core/network/local/cache_helper.dart';
import 'core/resources/app_colors.dart';
import 'core/services/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'features/base_layout/presentation/view_models/drawer_cubit/drawer_cubit.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  await initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => DrawerCubit(),
          child: MaterialApp.router(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
              fontFamily: 'Cairo',
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.routers,
          ),
        );
      },
    );
  }
}

Future<void> initialization() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().init();
  await CacheHelper.init();
  await DioHelper.init();

  AppConstant.currentLanguage =
      CacheHelper.getData(key: AppConstant.kCurrentLanguage) ?? 'en';
}
