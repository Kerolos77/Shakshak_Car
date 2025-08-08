part of 'wallet_cubit.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletTransactionsLoading extends WalletState {}

final class WalletTransactionsSuccess extends WalletState {
  final WalletTransactionsModel walletTransactionsModel;

  WalletTransactionsSuccess({required this.walletTransactionsModel});
}

final class WalletTransactionsFailure extends WalletState {
  final String errorMessage;

  WalletTransactionsFailure({required this.errorMessage});
}
