import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';
import '../models/signup_body.dart';

abstract class AuthRepo {
  Future<Either<Failure, ProfileModel>> signup(
      {required SignupBody signupBody});

  Future<Either<Failure, LoginModel>> login({required LoginBody loginBody});

  Future<Either<Failure, CountryModel>> getCountries();

  Future<Either<Failure, CityModel>> getCities({
    required int countryId,
  });

  Future<Either<Failure, ProfileModel>> verifyPhoneOtp({required String otp});

  Future<Either<Failure, ProfileModel>> getProfile();

  Future<Either<Failure, ProfileModel>> updateProfile({
    required String name,
    required String email,
    required int countryId,
    required int cityId,
    File? photo,
  });
}
