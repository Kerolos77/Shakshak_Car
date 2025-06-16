import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';
import 'package:shakshak/features/authentication/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:shakshak/features/authentication/presentation/views/login_view.dart';
import 'package:shakshak/features/authentication/presentation/views/otp_view.dart';
import 'package:shakshak/features/authentication/presentation/views/profile_view.dart';
import 'package:shakshak/features/authentication/presentation/views/register_view.dart';
import 'package:shakshak/features/contact_us/presentation/views/contact_us_view.dart';
import 'package:shakshak/features/driver/home/presentation/views/driver_home_view.dart';
import 'package:shakshak/features/driver/online_registration/views/car_licence_view.dart';
import 'package:shakshak/features/driver/online_registration/views/car_view.dart';
import 'package:shakshak/features/driver/online_registration/views/criminal_record_view.dart';
import 'package:shakshak/features/driver/online_registration/views/driver_online_registration_view.dart';
import 'package:shakshak/features/driver/online_registration/views/licence_view.dart';
import 'package:shakshak/features/driver/online_registration/views/national_id_view.dart';
import 'package:shakshak/features/faq/presentation/views/faq_view.dart';
import 'package:shakshak/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:shakshak/features/out_station_rides/presentation/views/outstation_rides_view.dart';
import 'package:shakshak/features/outstation/presentation/views/out_station_view.dart';
import 'package:shakshak/features/rides/presentation/views/rides_view.dart';
import 'package:shakshak/features/settings/presentation/views/settings_view.dart';
import 'package:shakshak/features/splash/presentation/views/splash_view.dart';
import 'package:shakshak/features/terms_and_conditions/presetation/views/terms_and_conditions_view.dart';
import 'package:shakshak/features/user_home/presentation/views/user_home_view.dart';
import 'package:shakshak/features/wallet/presentation/views/wallet_view.dart';

import '../../features/authentication/presentation/views/role_selection_view.dart';
import '../../features/driver/outstation/presentation/views/driver_outstation_view.dart';
import '../../features/terms_and_conditions/presetation/views/privacy_policy_view.dart';
import '../services/service_locator.dart';
import 'routes.dart';

abstract class AppRouter {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get globalContext => navigatorKey.currentContext!;

  static final routers = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: Routes.loginView,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splashView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: Routes.onBoardingView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: OnBoardingView(),
        ),
      ),
      GoRoute(
        path: Routes.roleSelectionView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(sl<AuthRepo>()),
            child: RoleSelectionView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.loginView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(sl<AuthRepo>()),
            child: LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.termsAndConditionsView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: TermsAndConditionsView(),
        ),
      ),
      GoRoute(
        path: Routes.privacyPolicyView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: PrivacyPolicyView(),
        ),
      ),
      GoRoute(
        path: Routes.otpView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(sl<AuthRepo>()),
            child: OtpView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.registerView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(sl<AuthRepo>()),
            child: RegisterView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.profileView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => AuthCubit(sl<AuthRepo>()),
            child: ProfileView(),
          ),
        ),
      ),
      GoRoute(
        path: Routes.settingsView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: SettingsView(),
        ),
      ),
      GoRoute(
        path: Routes.userHomeView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: UserHomeView(),
        ),
      ),
      GoRoute(
        path: Routes.outStationView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: OutStationView(),
        ),
      ),
      GoRoute(
        path: Routes.ridesView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: RidesView(),
        ),
      ),
      GoRoute(
        path: Routes.outstationRidesView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: OutstationRidesView(),
        ),
      ),
      GoRoute(
        path: Routes.walletView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: WalletView(),
        ),
      ),
      GoRoute(
        path: Routes.contactUsView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: ContactUsView(),
        ),
      ),
      GoRoute(
        path: Routes.faqView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: FaqView(),
        ),
      ),
      // --------------------------------- Driver ---------------------------------
      GoRoute(
        path: Routes.driverHomeView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: DriverHomeView(),
        ),
      ),
      GoRoute(
        path: Routes.driverOnlineRegistrationView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: DriverOnlineRegistrationView(),
        ),
      ),
      GoRoute(
        path: Routes.criminalRecordView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: CriminalRecordView(),
        ),
      ),
      GoRoute(
        path: Routes.nationalIdView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: NationalIdView(),
        ),
      ),
      GoRoute(
        path: Routes.licenceView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: LicenceView(),
        ),
      ),
      GoRoute(
        path: Routes.carLicenceView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: CarLicenceView(),
        ),
      ),
      GoRoute(
        path: Routes.carView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: CarView(),
        ),
      ),
      GoRoute(
        path: Routes.driverOutstationView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: DriverOutstationView(),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(0, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            child: child),
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
