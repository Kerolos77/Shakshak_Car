import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/wallet/data/models/charge_wallet_model.dart';
import 'package:shakshak/features/wallet/data/models/wallet_transactions_model.dart';
import 'package:shakshak/features/wallet/data/repo/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this.walletRepo) : super(WalletInitial());
  final WalletRepo walletRepo;

  Future<void> getWalletTransactions() async {
    emit(WalletTransactionsLoading());
    var result = await walletRepo.getWalletTransactions();
    result.fold((error) {
      debugPrint("error while get wallet transactions data ${error.message}");
      return emit(WalletTransactionsFailure(errorMessage: error.message));
    }, (success) {
      return emit(WalletTransactionsSuccess(walletTransactionsModel: success));
    });
  }

  Future<void> chargeWallet({required double value}) async {
    emit(ChargeWalletLoading());
    var result = await walletRepo.chargeWallet(value: value);
    result.fold((error) {
      debugPrint("error while charge wallet ${error.message}");
      return emit(ChargeWalletFailure(errorMessage: error.message));
    }, (success) {
      return emit(ChargeWalletSuccess(chargeWalletModel: success));
    });
  }
}
