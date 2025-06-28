class LoginModel {
  String? data;
  String? msg;
  int? status;
  bool? statusval;

  LoginModel({ this.data,
    this.msg,
    this.status,
    this.statusval,});

  LoginModel.fromJson(dynamic json) {
    data = json['data'];
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }
}
 