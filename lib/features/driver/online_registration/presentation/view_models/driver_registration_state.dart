part of 'driver_registration_cubit.dart';

@immutable
sealed class DriverRegistrationState {}

final class DriverRegistrationInitial extends DriverRegistrationState {}

// Image storage states
final class CriminalRecordImageStoredState extends DriverRegistrationState {}

final class NationalIdImageStoredState extends DriverRegistrationState {}

final class LicenceImageStoredState extends DriverRegistrationState {}

final class CarLicenceImageStoredState extends DriverRegistrationState {}

final class CarImageStoredState extends DriverRegistrationState {}

final class NationalIdBirthDateStoredState extends DriverRegistrationState {}

final class CarDataStoredState extends DriverRegistrationState {}

// API states
final class DriverRegistrationLoading extends DriverRegistrationState {}

final class DriverRegistrationSuccess extends DriverRegistrationState {
  final DriverRegistrationModel driverRegistrationModel;

  DriverRegistrationSuccess({required this.driverRegistrationModel});
}

final class DriverRegistrationFailure extends DriverRegistrationState {
  final String errorMessage;

  DriverRegistrationFailure({required this.errorMessage});
}

// Data management states
final class DriverRegistrationDataClearedState extends DriverRegistrationState {} 