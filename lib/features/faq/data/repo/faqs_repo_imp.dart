import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/faqs_model.dart';
import 'faqs_repo.dart';

class FaqsRepoImp implements FaqsRepo {
  @override
  Future<Either<Failure, FaqsModel>> getFaqs() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getFaqsUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(FaqsModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
