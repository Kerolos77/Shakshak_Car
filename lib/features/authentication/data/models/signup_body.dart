import 'dart:convert';

class SignupBody {
  final String userName;
  final String phone;

  final String email;
  final int countryId;
  final int cityId;

  // final int roleId;

  SignupBody({
    required this.userName,
    required this.phone,
    required this.email,
    required this.countryId,
    required this.cityId,
    // required this.roleId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': userName,
      'phone': phone,
      'email': email,
      'country_id': countryId,
      'city_id': cityId,
      // 'role_id': roleId,
    };
  }

  factory SignupBody.fromMap(Map<String, dynamic> map) {
    return SignupBody(
      userName: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      countryId: map['country_id'] as int,
      cityId: map['city_id'] as int,
      // roleId: map['role_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupBody.fromJson(String source) =>
      SignupBody.fromMap(json.decode(source) as Map<String, dynamic>);
}
