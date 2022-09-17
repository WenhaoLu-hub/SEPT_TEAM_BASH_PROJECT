import 'dart:convert';

import 'package:team_bash_project/Screens/PatientProfilePage/patientProfile.dart';

PatientProfileModel patientProfileModelFromJson(String str) =>
    PatientProfileModel.fromJson(json.decode(str));

String patientProfileModelToJson(PatientProfileModel data) =>
    json.encode(data.toJson());

class PatientProfileModel {
  PatientProfileModel({
    required this.email,
    required this.password,
    required this.accountType,
    required this.firstname,
    required this.lastname,
  });
  String email;
  String password;
  String accountType;
  String firstname;
  String lastname;

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) =>
      PatientProfileModel(
        email: json["email"],
        password: json["password"],
        accountType: json["accountType"],
        lastname: json["lastname"],
        firstname: json["firstname"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "accountType": accountType,
        "lastname": lastname,
        "firstname": firstname,
      };
}
