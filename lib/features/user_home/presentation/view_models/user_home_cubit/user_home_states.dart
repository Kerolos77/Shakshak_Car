import '../../../data/models/place_model.dart';

abstract class UserHomeState {}

class InitialUserHomeState extends UserHomeState {}

class ChangeLocationUserHomeState extends UserHomeState {}

class GetMyLocationUserHomeState extends UserHomeState {}

class GetMyLocationUpDateUserHomeState extends UserHomeState {}

class ChangeBuscandoFlagUserHomeState extends UserHomeState {}

class ChangeAddressUserHomeState extends UserHomeState {}

class LoadingCreateAlertUserHomeState extends UserHomeState {}

class SuccessCreateAlertUserHomeState extends UserHomeState {}

class ErrorCreateAlertUserHomeState extends UserHomeState {
  final String error;

  ErrorCreateAlertUserHomeState(this.error);
}

class LoadingSendNotificationUserHomeState extends UserHomeState {}

class SuccessSendNotificationUserHomeState extends UserHomeState {}

class ErrorSendNotificationUserHomeState extends UserHomeState {
  final String error;

  ErrorSendNotificationUserHomeState(this.error);
}

class LoadingGetAddressUserHomeState extends UserHomeState {}

class SuccessGetAddressUserHomeState extends UserHomeState {}

class SuccessGetDestinationAddressUserHomeState extends UserHomeState {}

class ErrorGetAddressUserHomeState extends UserHomeState {
  final String error;

  ErrorGetAddressUserHomeState(this.error);
}

class OpenTripContainerUserHomeState extends UserHomeState {}

class CloseTripContainerUserHomeState extends UserHomeState {}

final class GetCategoryOfVehicleLoading extends UserHomeState {}

final class GetCategoryOfVehicleFailure extends UserHomeState {
  final String message;

  GetCategoryOfVehicleFailure({required this.message});
}

/// --------------------
/// Suggestions States
/// --------------------
class SuggestionsLoadingState extends UserHomeState {}

class SuggestionsLoadedState extends UserHomeState {
  final List<PlacePrediction> suggestions;

  SuggestionsLoadedState(this.suggestions);
}

class SuggestionsErrorState extends UserHomeState {
  final String error;

  SuggestionsErrorState(this.error);
}

/// --------------------
/// Place Details States
/// --------------------
class PlaceDetailsLoadingState extends UserHomeState {}

class PlaceDetailsLoadedState extends UserHomeState {
  final double lat;
  final double lng;
  final String address;

  PlaceDetailsLoadedState({
    required this.lat,
    required this.lng,
    required this.address,
  });
}

class PlaceDetailsErrorState extends UserHomeState {
  final String error;

  PlaceDetailsErrorState(this.error);
}

class PlaceSelectedState extends UserHomeState {
  final PlacePrediction? sourcePlace;
  final PlacePrediction? destinationPlace;

  PlaceSelectedState(this.sourcePlace, this.destinationPlace);
}

class UserHomeErrorState extends UserHomeState {
  final String message;

  UserHomeErrorState(this.message);
}
