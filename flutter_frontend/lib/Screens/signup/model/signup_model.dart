import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.accountType,
  });

  String email;
  String firstName;
  String lastName;
  String password;
  String accountType;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        firstName:json["firstName"],
        lastName:json["lastName"],
        password: json["password"],
        accountType: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName":firstName,
        "lastName":lastName,
        "password": password,
        "type": accountType,
      };
}
