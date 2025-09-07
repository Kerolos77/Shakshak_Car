import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/user_home/data/models/user_home_caption_model.dart';
import 'package:shakshak/features/user_home/data/repo/user_home_repo.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/services_model.dart';

class UserHomeRepoImp implements UserHomeRepo {
  @override
  Future<Either<Failure, UserHomeCaptionModel>> getCaptions() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getCaptionsUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(UserHomeCaptionModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServicesModel>> getServices() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getServicesUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(ServicesModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
