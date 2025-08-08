import 'rides_data.dart';

class RidesModel {
  RidesModel({
    this.data,
    this.msg,
    this.status,
    this.statusval,
  });

  RidesModel.fromJson(dynamic json) {
    data = json['data'] != null ? RidesData.fromJson(json['data']) : null;
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }

  RidesData? data;
  String? msg;
  int? status;
  bool? statusval;
}
