part of 'user_home_cubit.dart';

@immutable
sealed class UserHomeState {}

final class UserHomeInitial extends UserHomeState {}

final class UserHomeCaptionLoading extends UserHomeState {}

final class UserHomeCaptionSuccess extends UserHomeState {
  final UserHomeCaptionModel userHomeCaptionModel;

  UserHomeCaptionSuccess({required this.userHomeCaptionModel});
}

final class UserHomeCaptionFailure extends UserHomeState {
  final String errorMessage;

  UserHomeCaptionFailure({required this.errorMessage});
}

final class ServicesLoading extends UserHomeState {}

final class ServicesSuccess extends UserHomeState {
  final ServicesModel servicesModel;

  ServicesSuccess({required this.servicesModel});
}

final class ServicesFailure extends UserHomeState {
  final String errorMessage;

  ServicesFailure({required this.errorMessage});
}
