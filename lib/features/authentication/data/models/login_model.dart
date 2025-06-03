class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
}

class User {
  User({
    this.id,
    this.name,
    this.nameEn,
    this.email,
    this.roleId,
    this.twoFactorConfirmedAt,
    this.phone,
    this.gender,
    this.birthDate,
    this.verfiedAt,
    this.isTrusted,
    this.profilePhotoPath,
    this.identificationVerifiedAt,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.description,
    this.onesignalId,
    this.userLang,
    this.online,
    this.userName,
    this.isActive,
    this.verifyAccountOneTime,
    this.profilePhotoUrl,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    email = json['email'];
    roleId = json['role_id'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    phone = json['phone'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    verfiedAt = json['verfied_at'];
    isTrusted = json['is_trusted'];
    profilePhotoPath = json['profile_photo_path'];
    identificationVerifiedAt = json['identification_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    description = json['description'];
    onesignalId = json['onesignal_id'];
    userLang = json['user_lang'];
    online = json['online'];
    userName = json['user_name'];
    isActive = json['is_active'];
    verifyAccountOneTime = json['verify_account_one_time'];
    profilePhotoUrl = json['profile_photo_url'];
    hasServices = json['has_services'];
    hasAreas = json['has_areas'];
  }

  int? id;
  String? name;
  String? nameEn;
  String? email;
  int? roleId;
  String? twoFactorConfirmedAt;
  String? phone;
  String? gender;
  String? birthDate;
  String? verfiedAt;
  String? isTrusted;
  String? profilePhotoPath;
  String? identificationVerifiedAt;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? description;
  String? onesignalId;
  String? userLang;
  String? online;
  String? userName;
  String? isActive;
  String? verifyAccountOneTime;
  String? profilePhotoUrl;
  bool? hasServices;
  bool? hasAreas;
}
