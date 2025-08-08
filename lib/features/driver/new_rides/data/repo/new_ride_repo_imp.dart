import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shakshak/features/driver/new_rides/data/models/ride_model.dart';

import '../../../../../core/constants/api_const.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/network/dio_helper/dio_helper.dart';
import 'new_ride_repo.dart';

class NewRideRepoImp implements NewRideRepo{
  @override
  Future<Either<Failure, List<RideModel>>> fetchNewRides()async {
    try {
      var data = await DioHelper.getData(
        url: ApiConstant.orderOldForDriver,
        token: ApiConstant.testDriverToken,
      );
      var rideList = (data.data['data']['searching']as List)
      .map((ride) => RideModel.fromJson(ride))
      .toList();

          // var ride = RideModel.fromJson(rideList[0]);
      // print("rideList: ${ride}");
      return right(rideList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}