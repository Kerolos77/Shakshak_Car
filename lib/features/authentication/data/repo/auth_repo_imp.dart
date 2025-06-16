import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';
import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failure, LoginModel>> login(
      {required LoginBody loginBody}) async {
    try {
      var data = await DioHelper.postDataWithoutToken(
        url: ApiConstant.loginUrl,
        data: loginBody.toMap(),
      );
      return right(LoginModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
