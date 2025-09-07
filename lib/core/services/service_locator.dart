import 'package:get_it/get_it.dart';
import 'package:shakshak/features/driver/new_rides/data/repo/new_ride_repo.dart';
import 'package:shakshak/features/driver/new_rides/data/repo/new_ride_repo_imp.dart';
import 'package:shakshak/features/faq/data/repo/faqs_repo_imp.dart';
import 'package:shakshak/features/static_pages/data/repo/static_pages_repo.dart';
import 'package:shakshak/features/wallet/data/repo/wallet_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/repo/auth_repo.dart';
import '../../features/authentication/data/repo/auth_repo_imp.dart';
import '../../features/contact_us/data/repo/contact_us_repo.dart';
import '../../features/contact_us/data/repo/contact_us_repo_imp.dart';
import '../../features/driver/home/data/repo/driver_home_repo.dart';
import '../../features/driver/home/data/repo/driver_home_repo_imp.dart';
import '../../features/driver/online_registration/data/repo/driver_registration_repo.dart';
import '../../features/driver/online_registration/data/repo/driver_registration_repo_imp.dart';
import '../../features/driver/online_registration/presentation/view_models/driver_registration_cubit.dart';
import '../../features/faq/data/repo/faqs_repo.dart';
import '../../features/rides/data/repo/rides_repo.dart';
import '../../features/rides/data/repo/rides_repo_imp.dart';
import '../../features/static_pages/data/repo/static_pages_repo_imp.dart';
import '../../features/user_home/data/repo/static_pages_repo_imp.dart';
import '../../features/user_home/data/repo/user_home_repo.dart';
import '../../features/wallet/data/repo/wallet_repo_imp.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    await _initSharedPref();
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(),
    );
    sl.registerLazySingleton<NewRideRepo>(
          () => NewRideRepoImp(),
    );
    sl.registerLazySingleton<RidesRepo>(
      () => RidesRepoImp(),
    );
    sl.registerLazySingleton<WalletRepo>(
      () => WalletRepoImp(),
    );
    sl.registerLazySingleton<FaqsRepo>(
      () => FaqsRepoImp(),
    );
    sl.registerLazySingleton<ContactUsRepo>(
      () => ContactUsRepoImp(),
    );
    sl.registerLazySingleton<StaticPagesRepo>(
      () => StaticPagesRepoImp(),
    );
    sl.registerLazySingleton<DriverRegistrationRepo>(
      () => DriverRegistrationRepoImp(),
    );
    sl.registerSingleton<DriverRegistrationCubit>(
      DriverRegistrationCubit(sl<DriverRegistrationRepo>()),
    );
    sl.registerSingleton<DriverHomeRepo>(
      DriverHomeRepoImp(),
    );
    sl.registerSingleton<UserHomeRepo>(
      UserHomeRepoImp(),
    );
  }

  Future<void> _initSharedPref() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPref);
  }
}
