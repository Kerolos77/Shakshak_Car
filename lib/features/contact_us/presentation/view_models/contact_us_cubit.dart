import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/contact_us_model.dart';
import '../../data/models/write_us_model.dart';
import '../../data/repo/contact_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.contactUsRepo) : super(ContactUsInitial());

  final ContactUsRepo contactUsRepo;

  Future<void> getContactUs() async {
    emit(ContactUsLoading());
    var result = await contactUsRepo.getContactUs();
    result.fold((error) {
      debugPrint("error while get contact us data ${error.message}");
      return emit(ContactUsFailure(errorMessage: error.message));
    }, (success) {
      return emit(ContactUsSuccess(contactUsModel: success));
    });
  }

  Future<void> writeUs({
    required String email,
    required String description,
  }) async {
    emit(WriteUsLoading());
    var result =
        await contactUsRepo.writeUs(email: email, description: description);
    result.fold((error) {
      debugPrint("error while get write us data ${error.message}");
      return emit(WriteUsFailure(errorMessage: error.message));
    }, (success) {
      return emit(WriteUsSuccess(writeUsModel: success));
    });
  }
}
