import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shakshak/features/driver/home/data/models/driver_toggle_online_model.dart';
import 'package:shakshak/features/driver/home/data/repo/driver_home_repo.dart';

part 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  DriverHomeCubit(this.driverHomeRepo) : super(DriverHomeInitial());
  final DriverHomeRepo driverHomeRepo;

  Future<void> driverToggleOnline({required int value}) async {
    emit(DriverToggleOnlineLoading());
    var result = await driverHomeRepo.driverToggleOnline(value: value);
    result.fold((error) {
      debugPrint("error while driver toggle online   ${error.message}");
      return emit(DriverToggleOnlineFailure(errorMessage: error.message));
    }, (success) {
      return emit(DriverToggleOnlineSuccess(driverToggleOnlineModel: success));
    });
  }
}
