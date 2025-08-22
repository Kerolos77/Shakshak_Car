class ChargeWalletModel {
  ChargeWalletModel({
    this.data,
    this.msg,
    this.status,
    this.statusval,
  });

  ChargeWalletModel.fromJson(dynamic json) {
    data = json['data'];
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }

  String? data;
  String? msg;
  num? status;
  bool? statusval;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['msg'] = msg;
    map['status'] = status;
    map['statusval'] = statusval;
    return map;
  }
}
