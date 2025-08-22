import 'package:dartz/dartz.dart';
import 'package:shakshak/features/driver/home/data/models/driver_toggle_online_model.dart';

import '../../../../../core/error/failure.dart';

abstract class DriverHomeRepo {
  Future<Either<Failure, DriverToggleOnlineModel>> driverToggleOnline(
      {required int value});
}
