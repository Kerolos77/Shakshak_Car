import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
      debugPrint("error while get countries data ${error.message}");
      return emit(WalletTransactionsFailure(errorMessage: error.message));
    }, (success) {
      return emit(WalletTransactionsSuccess(walletTransactionsModel: success));
    });
  }
}
