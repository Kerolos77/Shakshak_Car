import 'package:shakshak/features/driver/new_rides/data/models/user_model.dart';

class RideModel {
  final String id;
  final String destinationLat;
  final String destinationLong;
  final String destinationAddress;
  final String sourceLat;
  final String sourceLong;
  final String sourceAddress;
  final String amount;
  final String finalRate;
  final String distance;
  final String distanceType;
  final String status;
  final String offerDriver;
  final String isOffer;
  final String createdAt;
  final PersonModel? driver;
  final PersonModel user;
  final String whenDate;
  final String interCity;
  final String userServiceId;
  final String paid;
  final String paymentType;
  final String commission;
  final String destinationCity;
  final String sourceCity;
  final String parcelDimension;
  final String parcelImage;
  final String parcelWeight;
  final String numberOfPassenger;
  final String isPlaced;
  final String isStarted;
  final String isAccept;
  final String isComplete;
  final String isCanceled;
  final String canceledBy;
  final String comment;
  final String serviceType;

  RideModel({
    required this.id,
    required this.destinationLat,
    required this.destinationLong,
    required this.destinationAddress,
    required this.sourceLat,
    required this.sourceLong,
    required this.sourceAddress,
    required this.amount,
    required this.finalRate,
    required this.distance,
    required this.distanceType,
    required this.status,
    required this.offerDriver,
    required this.isOffer,
    required this.createdAt,
    required this.driver,
    required this.user,
    required this.whenDate,
    required this.interCity,
    required this.userServiceId,
    required this.paid,
    required this.paymentType,
    required this.commission,
    required this.destinationCity,
    required this.sourceCity,
    required this.parcelDimension,
    required this.parcelImage,
    required this.parcelWeight,
    required this.numberOfPassenger,
    required this.isPlaced,
    required this.isStarted,
    required this.isAccept,
    required this.isComplete,
    required this.isCanceled,
    required this.canceledBy,
    required this.comment,
    required this.serviceType,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {

    return RideModel(
      id: json['id'].toString(),
      destinationLat: json['destination_lat'].toString(),
      destinationLong: json['destination_long'].toString(),
      destinationAddress: json['destination_address'].toString(),
      sourceLat: json['source_lat'].toString(),
      sourceLong: json['source_long'].toString(),
      sourceAddress: json['source_address'].toString(),
      amount: json['amount'].toString(),
      finalRate: json['final_rate'].toString(),
      distance: json['distance'].toString(),
      distanceType: json['distance_type'].toString(),
      status: json['status'].toString(),
      offerDriver: json['offerdriver'].toString(),
      isOffer: json['is_offer'].toString(),
      createdAt: json['created_at'].toString(),
      driver: json['driver'] != "" ? PersonModel.fromJson(json['driver']) : null,
      user: PersonModel.fromJson(json['user']),
      whenDate: json['when_date'].toString(),
      interCity: json['inter_city'].toString(),
      userServiceId: json['user_service_id'].toString(),
      paid: json['paid'].toString(),
      paymentType: json['payment_type'].toString(),
      commission: json['commission'].toString(),
      destinationCity: json['destination_City'].toString(),
      sourceCity: json['source_city'].toString(),
      parcelDimension: json['parcel_dimension'].toString(),
      parcelImage: json['parcel_image'].toString(),
      parcelWeight: json['parcel_weight'].toString(),
      numberOfPassenger: json['number_of_passenger'].toString(),
      isPlaced: json['is_placed'].toString(),
      isStarted: json['is_started'].toString(),
      isAccept: json['is_accept'].toString(),
      isComplete: json['is_complete'].toString(),
      isCanceled: json['is_canceled'].toString(),
      canceledBy: json['canceled_by'].toString() ,
      comment: json['comment'].toString(),
      serviceType: json['service_type'].toString(),
    );
  }
}
