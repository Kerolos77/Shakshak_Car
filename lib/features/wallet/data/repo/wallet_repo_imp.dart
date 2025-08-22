import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/wallet/data/models/charge_wallet_model.dart';
import 'package:shakshak/features/wallet/data/models/wallet_transactions_model.dart';
import 'package:shakshak/features/wallet/data/repo/wallet_repo.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';

class WalletRepoImp implements WalletRepo {
  @override
  Future<Either<Failure, WalletTransactionsModel>>
      getWalletTransactions() async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.getWalletTransactionsUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
      );
      return right(WalletTransactionsModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChargeWalletModel>> chargeWallet(
      {required double value}) async {
    try {
      var data = await DioHelper.getData(
          url: ApiConstant.chargeWalletUrl,
          token: CacheHelper.getData(key: AppConstant.kToken),
          query: {
            'value': value,
          });
      return right(ChargeWalletModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
