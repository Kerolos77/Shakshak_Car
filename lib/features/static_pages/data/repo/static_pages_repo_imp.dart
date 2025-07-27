import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/static_pages/data/repo/static_pages_repo.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/static_pages_model.dart';

class StaticPagesRepoImp implements StaticPagesRepo {
  @override
  Future<Either<Failure, StaticPagesModel>> getStaticPages(
      {required int id}) async {
    try {
      var data = await DioHelper.getData(
          url: ApiConstant.getStaticPagesUrl,
          token: CacheHelper.getData(key: AppConstant.kToken),
          query: {
            'id': id,
          });
      return right(StaticPagesModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
