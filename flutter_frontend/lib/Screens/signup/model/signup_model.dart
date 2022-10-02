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
    required this.doctor_id,
  });

  String email;
  String firstName;
  String lastName;
  String password;
  String accountType;
  String doctor_id;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        email: json["email"],
        firstName:json["firstName"],
        lastName:json["lastName"],
        password: json["password"],
        accountType: json["type"],
        doctor_id: json["doctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName":firstName,
        "lastName":lastName,
        "password": password,
        "type": accountType,
        "doctor_id":doctor_id,
      };
}
