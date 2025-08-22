import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/driver/home/data/models/driver_toggle_online_model.dart';

import '../../../../../core/constants/api_const.dart';
import '../../../../../core/network/dio_helper/dio_helper.dart';
import 'driver_home_repo.dart';

class DriverHomeRepoImp implements DriverHomeRepo {
  @override
  Future<Either<Failure, DriverToggleOnlineModel>> driverToggleOnline(
      {required int value}) async {
    try {
      var data = await DioHelper.getData(
        url: '${ApiConstant.driverToggleOnlineUrl}/$value',
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(DriverToggleOnlineModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
