class SignupModel {
  bool? status;
  String? message;
  Data? data;

  SignupModel({this.status, this.message, this.data});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    message = json['message'] ?? '';
    data = json['data'] != null ? Data.fromJson(json['data']) : Data();
  }
}

class Data {
  Data({
    this.user,
    this.token,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class User {
  User({
    this.name,
    this.nameEn,
    this.email,
    this.phone,
    this.roleId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePhotoUrl,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    nameEn = json['name_en'];
    email = json['email'];
    phone = json['phone'];
    roleId = json['role_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  String? name;
  String? nameEn;
  String? email;
  String? phone;
  int? roleId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['name_en'] = nameEn;
    map['email'] = email;
    map['phone'] = phone;
    map['role_id'] = roleId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
