import 'dart:convert';

class LoginBody {
  final String emailOrPhone;

  LoginBody({
    required this.emailOrPhone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': emailOrPhone,
    };
  }

  factory LoginBody.fromMap(Map<String, dynamic> map) {
    return LoginBody(
      emailOrPhone: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginBody.fromJson(String source) =>
      LoginBody.fromMap(json.decode(source) as Map<String, dynamic>);
}
