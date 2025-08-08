import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/static_pages/data/models/static_pages_model.dart';
import 'package:shakshak/features/static_pages/data/repo/static_pages_repo.dart';

part 'static_pages_state.dart';

class StaticPagesCubit extends Cubit<StaticPagesState> {
  StaticPagesCubit(this.staticPagesRepo) : super(StaticPagesInitial());

  final StaticPagesRepo staticPagesRepo;

  Future<void> getStaticPages({required int id}) async {
    emit(StaticPagesLoading());
    var result = await staticPagesRepo.getStaticPages(id: id);
    result.fold((error) {
      debugPrint("error while get StaticPages data ${error.message}");
      return emit(StaticPagesFailure(errorMessage: error.message));
    }, (success) {
      return emit(StaticPagesSuccess(staticPagesModel: success));
    });
  }
}
