class SignupModel {
  Data? data;
  String? msg;
  int? status;
  bool? statusval;

  SignupModel({
    this.data,
    this.msg,
    this.status,
    this.statusval,
  });

  SignupModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.phone,
    this.image,
    this.countryId,
    this.city,
    this.email,
    this.walletAmount,
    this.pendingWallet,
    this.driverStatus,
    this.isDriver,
    this.isOnline,
    this.serviceId,
    this.token,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    countryId = json['country_id'];
    city = json['city'];
    email = json['email'];
    walletAmount = json['wallet_amount'];
    pendingWallet = json['pending_wallet'];
    driverStatus = json['driver_status'];
    isDriver = json['is_driver'];
    isOnline = json['is_online'];
    serviceId = json['service_id'];
    token = json['token'];
  }

  int? id;
  String? name;
  String? phone;
  String? image;
  dynamic countryId;
  dynamic city;
  String? email;
  String? walletAmount;
  int? pendingWallet;
  String? driverStatus;
  int? isDriver;
  dynamic isOnline;
  int? serviceId;
  String? token;
}
