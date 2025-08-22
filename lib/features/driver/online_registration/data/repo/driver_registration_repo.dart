import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../models/driver_registration_model.dart';

abstract class DriverRegistrationRepo {
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
  });
}
