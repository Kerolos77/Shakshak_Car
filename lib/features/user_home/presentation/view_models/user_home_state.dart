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

// offers & order
class AcceptOfferLoading extends UserHomeState {
  final int orderId;
  final int index;

  AcceptOfferLoading({required this.orderId, required this.index});
}

class AcceptOfferSuccess extends UserHomeState {
  final AcceptOfferModel acceptOfferModel;
  final int index;

  AcceptOfferSuccess({required this.acceptOfferModel, required this.index});
}

class AcceptOfferFailure extends UserHomeState {
  final String errorMessage;
  final int index;

  AcceptOfferFailure({required this.errorMessage, required this.index});
}

class OffersUpdated extends UserHomeState {
  final List<int> offers;

  OffersUpdated(this.offers);
}

final class CancelOrderLoading extends UserHomeState {}

final class CancelOrderSuccess extends UserHomeState {
  final AcceptOfferModel cancelOrderModel;

  CancelOrderSuccess({required this.cancelOrderModel});
}

final class CancelOrderFailure extends UserHomeState {
  final String errorMessage;

  CancelOrderFailure({required this.errorMessage});
}
