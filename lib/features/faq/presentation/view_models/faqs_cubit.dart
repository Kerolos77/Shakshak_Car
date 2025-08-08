import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/faq/data/models/faqs_model.dart';

import '../../data/repo/faqs_repo.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsCubit(this.faqsRepo) : super(FaqsInitial());

  final FaqsRepo faqsRepo;

  Future<void> getFaqs() async {
    emit(FaqsLoading());
    var result = await faqsRepo.getFaqs();
    result.fold((error) {
      debugPrint("error while get Faqs data ${error.message}");
      return emit(FaqsFailure(errorMessage: error.message));
    }, (success) {
      return emit(FaqsSuccess(faqsModel: success));
    });
  }
}
