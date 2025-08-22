class DriverToggleOnlineModel {
  DriverToggleOnlineModel({
    this.data,
    this.msg,
    this.status,
    this.statusval,
  });

  DriverToggleOnlineModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }

  Data? data;
  String? msg;
  num? status;
  bool? statusval;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['msg'] = msg;
    map['status'] = status;
    map['statusval'] = statusval;
    return map;
  }
}

class Data {
  Data({
    this.isOnline,
  });

  Data.fromJson(dynamic json) {
    isOnline = json['is_online'];
  }

  String? isOnline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_online'] = isOnline;
    return map;
  }
}
