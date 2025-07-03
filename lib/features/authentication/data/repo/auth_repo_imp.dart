import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/features/authentication/data/models/country_model.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/city_model.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';
import '../models/otp_model.dart';
import '../models/signup_body.dart';
import '../models/signup_model.dart';
import 'auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failure, CountryModel>> getCountries() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getCountriesUrl,
      );
      return right(CountryModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CityModel>> getCities({required int countryId}) async {
    try {
      var data = await DioHelper.getData(
        url: '${ApiConstant.getCitiesUrl}/$countryId',
      );
      return right(CityModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupModel>> signup(
      {required SignupBody signupBody}) async {
    try {
      var data = await DioHelper.postDataWithoutToken(
        url: ApiConstant.signupUrl,
        data: signupBody.toMap(),
      );
      return right(SignupModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OtpModel>> verifyPhoneOtp(
      {required int otp, required String registerToken}) async {
    try {
      var data = await DioHelper.postData(
        url: ApiConstant.verifyOtpUrl,
        token: registerToken,
        data: {
          'otp': otp,
        },
      );
      return right(OtpModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

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
