part of 'driver_home_cubit.dart';

@immutable
sealed class DriverHomeState {}

final class DriverHomeInitial extends DriverHomeState {}

final class DriverToggleOnlineLoading extends DriverHomeState {}

final class DriverToggleOnlineSuccess extends DriverHomeState {
  final DriverToggleOnlineModel driverToggleOnlineModel;

  DriverToggleOnlineSuccess({required this.driverToggleOnlineModel});
}

final class DriverToggleOnlineFailure extends DriverHomeState {
  final String errorMessage;

  DriverToggleOnlineFailure({required this.errorMessage});
}
