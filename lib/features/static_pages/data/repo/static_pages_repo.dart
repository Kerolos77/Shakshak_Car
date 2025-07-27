import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/static_pages_model.dart';

abstract class StaticPagesRepo {
  Future<Either<Failure, StaticPagesModel>> getStaticPages({required int id});
}
