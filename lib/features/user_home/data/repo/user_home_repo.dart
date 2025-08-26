import 'package:dartz/dartz.dart';
import 'package:shakshak/features/user_home/data/models/user_home_caption_model.dart';

import '../../../../core/error/failure.dart';
import '../models/services_model.dart';

abstract class UserHomeRepo {
  Future<Either<Failure, UserHomeCaptionModel>> getCaptions();

  Future<Either<Failure, ServicesModel>> getServices();
}
