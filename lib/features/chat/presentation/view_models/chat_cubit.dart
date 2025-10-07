import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/chat/data/models/send_message_model.dart';
import 'package:shakshak/features/chat/data/repo/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepo chatRepo;

  Future<void> sendMessage({
    required int tripId,
    required String message,
  }) async {
    emit(SendMessageLoading());
    var result = await chatRepo.sendMessage(tripId: tripId, message: message);
    result.fold((error) {
      debugPrint("error while send message ${error.message}");
      return emit(SendMessageFailure(errorMessage: error.message));
    }, (success) {
      return emit(SendMessageSuccess(writeUsModel: success));
    });
  }
}
