import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/wallet_transactions_model.dart';

abstract class WalletRepo {
  Future<Either<Failure, WalletTransactionsModel>> getWalletTransactions();

/*  Future<Either<Failure, WalletTransactionsModel>> chargeWallet();

  Future<Either<Failure, WalletTransactionsModel>> withdrawRequest();*/
}
