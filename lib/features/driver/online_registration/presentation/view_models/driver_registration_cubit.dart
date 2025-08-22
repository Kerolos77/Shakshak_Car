import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/driver/online_registration/data/repo/driver_registration_repo.dart';

import '../../data/models/driver_registration_model.dart';
part 'driver_registration_state.dart';

class DriverRegistrationCubit extends Cubit<DriverRegistrationState> {
  DriverRegistrationCubit(this.driverRegistrationRepo)
      : super(DriverRegistrationInitial());

  final DriverRegistrationRepo driverRegistrationRepo;

  // Stored images
  File? criminalRecordImage;
  File? nationalIdImage;
  File? licenceImage;
  File? carLicenceImage;
  File? carImage;
  String? nationalIdBirthDate;
  
  // Stored car data
  String? carNumber;
  String? carBrand;
  String? carYear;
  String? carModel;
  String? carColor;

  // Store criminal record image
  void storeCriminalRecordImage(File image) {
    criminalRecordImage = image;
    emit(CriminalRecordImageStoredState());
  }

  // Store national ID image
  void storeNationalIdImage(File image) {
    nationalIdImage = image;
    emit(NationalIdImageStoredState());
  }

  // Store licence image
  void storeLicenceImage(File image) {
    licenceImage = image;
    emit(LicenceImageStoredState());
  }

  // Store car licence image
  void storeCarLicenceImage(File image) {
    carLicenceImage = image;
    emit(CarLicenceImageStoredState());
  }

  // Store car image
  void storeCarImage(File image) {
    carImage = image;
    emit(CarImageStoredState());
  }

  // Store national ID birth date
  void storeNationalIdBirthDate(String date) {
    nationalIdBirthDate = date;
    emit(NationalIdBirthDateStoredState());
  }

  // Store car data
  void storeCarNumber(String number) {
    carNumber = number;
    emit(CarDataStoredState());
  }

  void storeCarBrand(String brand) {
    carBrand = brand;
    emit(CarDataStoredState());
  }

  void storeCarYear(String year) {
    carYear = year;
    emit(CarDataStoredState());
  }

  void storeCarModel(String model) {
    carModel = model;
    emit(CarDataStoredState());
  }

  void storeCarColor(String color) {
    carColor = color;
    emit(CarDataStoredState());
  }

  // Check if all required data is available
  bool get isAllDataComplete {
    return criminalRecordImage != null &&
        nationalIdImage != null &&
        licenceImage != null &&
        carLicenceImage != null &&
        carImage != null &&
        nationalIdBirthDate != null &&
        carNumber != null &&
        carBrand != null &&
        carYear != null &&
        carModel != null &&
        carColor != null;
  }

  // Getter methods for accessing stored data
  File? get storedCriminalRecordImage => criminalRecordImage;
  File? get storedNationalIdImage => nationalIdImage;
  File? get storedLicenceImage => licenceImage;
  File? get storedCarLicenceImage => carLicenceImage;
  File? get storedCarImage => carImage;
  String? get storedNationalIdBirthDate => nationalIdBirthDate;
  
  // Getter methods for car data
  String? get storedCarNumber => carNumber;
  String? get storedCarBrand => carBrand;
  String? get storedCarYear => carYear;
  String? get storedCarModel => carModel;
  String? get storedCarColor => carColor;

  // Submit driver registration
  Future<void> submitDriverRegistration() async {
    if (!isAllDataComplete) {
      emit(DriverRegistrationFailure(
          errorMessage: 'Please complete all required fields'));
      return;
    }

    emit(DriverRegistrationLoading());

    var result = await driverRegistrationRepo.submitDriverRegistration(
      nationalIdBirthDate: nationalIdBirthDate!,
      criminalRecordImage: criminalRecordImage!,
      nationalIdImage: nationalIdImage!,
      licenceImage: licenceImage!,
      carLicenceImage: carLicenceImage!,
      carImage: carImage!,
      carNumber: carNumber!,
      carBrand: carBrand!,
      carYear: carYear!,
      carModel: carModel!,
      carColor: carColor!,
    );

    result.fold((error) {
      debugPrint(
          "error while submitting driver registration ${error.toString()}");
      emit(DriverRegistrationFailure(errorMessage: error.toString()));
    }, (success) {
      emit(DriverRegistrationSuccess(driverRegistrationModel: success));
    });
  }

  // Clear all stored data
  void clearAllData() {
    criminalRecordImage = null;
    nationalIdImage = null;
    licenceImage = null;
    carLicenceImage = null;
    carImage = null;
    nationalIdBirthDate = null;
    carNumber = null;
    carBrand = null;
    carYear = null;
    carModel = null;
    carColor = null;
    emit(DriverRegistrationDataClearedState());
  }
}
