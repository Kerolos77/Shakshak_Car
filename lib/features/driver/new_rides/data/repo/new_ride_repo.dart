import 'package:dartz/dartz.dart';
import 'package:shakshak/features/driver/new_rides/data/models/ride_model.dart';
import 'package:shakshak/features/rides/data/models/ride.dart';

import '../../../../../core/error/failure.dart';

abstract class NewRideRepo{
  /// Fetches the list of new rides.
  ///
  /// Returns a list of rides or throws an exception if the fetch fails.
  Future<Either<Failure, List<Ride>>> fetchNewRides();

  /// Accepts a ride request.
  ///
  /// [rideId] is the identifier of the ride to accept.
  /// Returns true if the acceptance was successful, otherwise throws an exception.
  // Future<bool> acceptRide(String rideId);

  /// Rejects a ride request.
  ///
  /// [rideId] is the identifier of the ride to reject.
  /// Returns true if the rejection was successful, otherwise throws an exception.
  // Future<bool> rejectRide(String rideId);
}