import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/repo/auth_repo.dart';
import '../../features/authentication/data/repo/auth_repo_imp.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    await _initSharedPref();
    sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(),
    );
  }

  Future<void> _initSharedPref() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPref);
  }
}
