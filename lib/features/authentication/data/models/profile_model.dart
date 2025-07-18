class ProfileModel {
  ProfileModel({
    this.status,
    this.statusval,
    this.msg,
    this.data,
  });

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    statusval = json['statusval'];
    msg = json['msg'];
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      data = UserData.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  int? status;
  bool? statusval;
  String? msg;
  UserData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusval'] = statusval;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class UserData {
  UserData({
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

  UserData.fromJson(dynamic json) {
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
  dynamic pendingWallet;
  String? driverStatus;
  int? isDriver;
  int? isOnline;
  int? serviceId;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['image'] = image;
    map['country_id'] = countryId;
    map['city'] = city;
    map['email'] = email;
    map['wallet_amount'] = walletAmount;
    map['pending_wallet'] = pendingWallet;
    map['driver_status'] = driverStatus;
    map['is_driver'] = isDriver;
    map['is_online'] = isOnline;
    map['service_id'] = serviceId;
    map['token'] = token;
    return map;
  }
}
