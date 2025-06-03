import 'dart:convert';

class SignupBody {
  final String userName;
  final String email;
  final String password;
  final String phone;
  final int roleId;

  SignupBody({
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': userName,
      'email': email,
      'phone': phone,
      'password': password,
      'role_id': roleId,
    };
  }

  factory SignupBody.fromMap(Map<String, dynamic> map) {
    return SignupBody(
      userName: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
      roleId: map['role_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupBody.fromJson(String source) =>
      SignupBody.fromMap(json.decode(source) as Map<String, dynamic>);
}
