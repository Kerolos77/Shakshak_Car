import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/login_body.dart';
import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login({required LoginBody loginBody});
}
