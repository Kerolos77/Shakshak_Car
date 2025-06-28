import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/authentication/data/models/profile_model.dart';

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
  Future<Either<Failure, ProfileModel>> verifyPhoneOtp({required String otp}) async {
    try {
      final response = await DioHelper.getDataWithoutToken(
        url: ApiConstant.verifyOTP,
        query: {"code": otp},
      );
      print("response: $response");
      print("TYPE: ${response.data.runtimeType}");

      final jsonData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      final model = ProfileModel.fromJson(jsonData);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
