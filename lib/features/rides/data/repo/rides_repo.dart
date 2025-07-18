import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/rides_model.dart';

abstract class RidesRepo {
  Future<Either<Failure, RidesModel>> getRides({required int inCity});
}
