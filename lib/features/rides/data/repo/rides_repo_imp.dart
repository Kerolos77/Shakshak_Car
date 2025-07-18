import 'package:dartz/dartz.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/error/failure.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/rides/data/repo/rides_repo.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/network/dio_helper/dio_helper.dart';
import '../models/rides_model.dart';

class RidesRepoImp implements RidesRepo {
  @override
  Future<Either<Failure, RidesModel>> getRides({required int inCity}) async {
    // try {
    var data = await DioHelper.getData(
        url: ApiConstant.geUserRidesUrl,
        token: CacheHelper.getData(key: AppConstant.kToken),
        query: {
          'in_city': inCity,
        });
    return right(RidesModel.fromJson(data.data));
    // } catch (e) {
    //   if (e is DioException) {
    //     return left(ServerFailure.fromDioError(e));
    //   }
    //   return left(ServerFailure(e.toString()));
    // }
  }
}
