import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/charge_wallet_model.dart';
import '../models/wallet_transactions_model.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletTransactionsModel>> getWalletTransactions();

  Future<Either<Failure, ChargeWalletModel>> chargeWallet(
      {required double value});
/*
  Future<Either<Failure, WalletTransactionsModel>> withdrawRequest();*/
}
