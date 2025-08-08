abstract class RideState {}
class RideInitial extends RideState {}
class RideLoading extends RideState {}
class RideLoaded extends RideState {

}
class RideError extends RideState {
  final String message;

  RideError(this.message);
}
