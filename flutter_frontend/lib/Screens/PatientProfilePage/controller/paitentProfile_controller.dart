import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:team_bash_project/Screens/PatientProfilePage/model/patientProfile_model.dart';

class PatientProfileController extends GetxController {
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController lastnameEditingController = TextEditingController();
  TextEditingController firstnameEditingController = TextEditingController();
  void patientPro() async {
    PatientProfileModel patientProfileModel = PatientProfileModel(
        email: emailEditingController.text,
        password: passwordEditingController.text,
        lastname: lastnameEditingController.text,
        firstname: firstnameEditingController.text);
    print(
        "signup func signup para body -> \n" + signupModelToJson(signupModel));
    var response =
        await NetWorkHandler.post(signupModelToJson(signupModel), "/signup");
  }
}
