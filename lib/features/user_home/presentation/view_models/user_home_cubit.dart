import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/user_home/data/models/accept_offer_model.dart';
import 'package:shakshak/features/user_home/data/models/user_home_caption_model.dart';
import 'package:shakshak/features/user_home/data/repo/user_home_repo.dart';

import '../../data/models/services_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit(this.userHomeRepo) : super(UserHomeInitial());
  final UserHomeRepo userHomeRepo;
  int? loadingOfferIndex;
  List<int> offers = List.generate(10, (index) => index);

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

  Future<void> acceptOffer({
    required int orderId,
    required int driverId,
    required int index,
  }) async {
    loadingOfferIndex = index;
    emit(AcceptOfferLoading(orderId: orderId, index: index));

    final result =
        await userHomeRepo.acceptOffer(orderId: orderId, driverId: driverId);

    result.fold(
      (error) {
        debugPrint("Error while accepting offer: ${error.message}");
        emit(AcceptOfferFailure(errorMessage: error.message, index: index));
      },
      (success) {
        emit(AcceptOfferSuccess(acceptOfferModel: success, index: index));
      },
    );

    loadingOfferIndex = null;
  }

  void rejectOffer(int index) {
    if (index < 0 || index >= offers.length) return;

    offers.removeAt(index);
    emit(OffersUpdated(List.from(offers)));
  }

  Future<void> cancelOrder({
    required int orderId,
  }) async {
    emit(CancelOrderLoading());
    final result = await userHomeRepo.cancelOrder(
      orderId: orderId,
    );
    result.fold(
      (error) {
        debugPrint("error while get services data ${error.message}");
        return emit(CancelOrderFailure(errorMessage: error.message));
      },
      (success) {
        return emit(CancelOrderSuccess(cancelOrderModel: success));
      },
    );
  }
}
