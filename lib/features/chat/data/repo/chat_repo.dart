import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/send_message_model.dart';

abstract class ChatRepo {
  Future<Either<Failure, SendMessageModel>> sendMessage({
    required int tripId,
    required String message,
  });
}
