import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import '../../../../../core/constants/api_const.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/dio_helper/dio_helper.dart';
import '../models/driver_registration_model.dart';
import 'driver_registration_repo.dart';

class DriverRegistrationRepoImp implements DriverRegistrationRepo {
  @override
  Future<Either<Failure, DriverRegistrationModel>> submitDriverRegistration({
    required String nationalIdBirthDate,
    required File criminalRecordImage,
    required File nationalIdImage,
    required File licenceImage,
    required File carLicenceImage,
    required File carImage,
    required String carNumber,
    required String carBrand,
    required String carYear,
    required String carModel,
    required String carColor,
  }) async {
    try {
      // Create form data
      FormData formData = FormData.fromMap({
        'national_id_birth_date': nationalIdBirthDate,
        'criminal_record': await MultipartFile.fromFile(
          criminalRecordImage.path,
          filename: 'criminal_record.jpg',
        ),
        'national_id': await MultipartFile.fromFile(
          nationalIdImage.path,
          filename: 'national_id.jpg',
        ),
        'licence': await MultipartFile.fromFile(
          licenceImage.path,
          filename: 'licence.jpg',
        ),
        'car_licence': await MultipartFile.fromFile(
          carLicenceImage.path,
          filename: 'car_licence.jpg',
        ),
        'car': await MultipartFile.fromFile(
          carImage.path,
          filename: 'car.jpg',
        ),
        'car_number': carNumber,
        'car_brand': carBrand,
        'car_year': carYear,
        'car_model': carModel,
        'car_color': carColor,
      });

      var data = await DioHelper.postData(
        url: ApiConstant.driverRegistrationUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
        data: formData,
      );

      return right(DriverRegistrationModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
