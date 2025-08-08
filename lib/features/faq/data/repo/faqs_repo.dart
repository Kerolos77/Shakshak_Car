import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/faqs_model.dart';

abstract class FaqsRepo {
  Future<Either<Failure, FaqsModel>> getFaqs();
}
