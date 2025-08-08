class ContactUsModel {
  ContactUsModel({
    this.success,
    this.data,
    this.message,
  });

  ContactUsModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  bool? success;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Data {
  Data({
    this.phone,
    this.email1,
  });

  Data.fromJson(dynamic json) {
    phone = json['phone'];
    email1 = json['email_1'];
  }

  dynamic phone;
  dynamic email1;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email_1'] = email1;
    return map;
  }
}
