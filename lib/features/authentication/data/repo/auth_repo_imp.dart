import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/authentication/data/models/country_model.dart';
import 'package:shakshak/features/authentication/data/models/profile_model.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/city_model.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';
import '../models/signup_body.dart';
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
  Future<Either<Failure, ProfileModel>> signup(
      {required SignupBody signupBody}) async {
    try {
      var data = await DioHelper.postDataWithoutToken(
        url: ApiConstant.signupUrl,
        data: signupBody.toMap(),
      );
      return right(ProfileModel.fromJson(data.data));
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
        url: ApiConstant.sendOTP,
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

  @override
  Future<Either<Failure, ProfileModel>> verifyPhoneOtp(
      {required String otp}) async {
    try {
      final response = await DioHelper.getDataWithoutToken(
        url: ApiConstant.verifyOTP,
        query: {"code": otp},
      );

      final jsonData =
          response.data is String ? jsonDecode(response.data) : response.data;

      final model = ProfileModel.fromJson(jsonData);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getProfileUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(ProfileModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updateProfile({
    required String name,
    required String email,
    required int countryId,
    required int cityId,
    File? photo,
  }) async {
    MultipartFile? photoFile;
    String photoName = '';

    if (photo != null) {
      photoName = photo.path.split('/').last;
      photoFile = await MultipartFile.fromFile(
        photo.path,
        filename: photoName,
      );
    }

    FormData data = FormData.fromMap({
      "name": name,
      "email": email,
      "country_id": countryId,
      "city_id": cityId,
      if (photo != null) "image": photoFile,
    });
    try {
      var response = await DioHelper.postData(
          url: ApiConstant.updateProfileUrl,
          token: CacheHelper.getData(key: AppConstant.kToken),
          data: data);
      return right(ProfileModel.fromJson(response.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
