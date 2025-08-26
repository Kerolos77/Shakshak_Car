import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/user_home/data/models/user_home_caption_model.dart';
import 'package:shakshak/features/user_home/data/repo/user_home_repo.dart';

import '../../data/models/services_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit(this.userHomeRepo) : super(UserHomeInitial());
  final UserHomeRepo userHomeRepo;

  Future<void> getCaptions() async {
    emit(UserHomeCaptionLoading());
    final result = await userHomeRepo.getCaptions();
    result.fold(
      (error) {
        debugPrint("error while get captions data ${error.message}");
        return emit(UserHomeCaptionFailure(errorMessage: error.message));
      },
      (success) {
        return emit(UserHomeCaptionSuccess(userHomeCaptionModel: success));
      },
    );
  }

  Future<void> getServices() async {
    emit(ServicesLoading());
    final result = await userHomeRepo.getServices();
    result.fold(
      (error) {
        debugPrint("error while get services data ${error.message}");
        return emit(ServicesFailure(errorMessage: error.message));
      },
      (success) {
        return emit(ServicesSuccess(servicesModel: success));
      },
    );
  }
}
