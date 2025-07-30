import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/contact_us_model.dart';
import '../models/write_us_model.dart';
import 'contact_us_repo.dart';

class ContactUsRepoImp implements ContactUsRepo {
  @override
  Future<Either<Failure, ContactUsModel>> getContactUs() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getContactUsUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(ContactUsModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WriteUsModel>> writeUs({
    required String email,
    required String description,
  }) async {
    try {
      var data = await DioHelper.postData(
          url: ApiConstant.writeUsUrl,
          token: CacheHelper.getData(key: AppConstant.kToken),
          data: {
            'email': email,
            'description': description,
          });
      return right(WriteUsModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
