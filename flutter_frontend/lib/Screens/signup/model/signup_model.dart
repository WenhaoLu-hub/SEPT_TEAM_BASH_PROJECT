import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.email,
    required this.password,
    required this.accountType,
  });

  String email;
  String password;
  String accountType;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        password: json["password"],
        accountType: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "type": accountType,
      };
}
