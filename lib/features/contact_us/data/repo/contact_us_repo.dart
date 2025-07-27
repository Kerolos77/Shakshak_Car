import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/contact_us_model.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, ContactUsModel>> getContactUs();
}
