import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/rides/data/models/rides_model.dart';
import 'package:shakshak/features/rides/data/repo/rides_repo.dart';

part 'rides_state.dart';

class RidesCubit extends Cubit<RidesState> {
  RidesCubit(this.ridesRepo) : super(RidesInitial());
  final RidesRepo ridesRepo;

  Future<void> getRides({required int inCity}) async {
    emit(RidesLoading());
    var result = await ridesRepo.getRides(inCity: inCity);
    result.fold((error) {
      debugPrint("error while get rides data ${error.message}");
      return emit(RidesFailure(errorMessage: error.message));
    }, (success) {
      return emit(RidesSuccess(ridesModel: success));
    });
  }
}
