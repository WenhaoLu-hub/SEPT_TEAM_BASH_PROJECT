import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/PatientHomepage/patientHome.dart';
import 'package:team_bash_project/Screens/PatientProfilePage/model/patientProfile_model.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';

class PatientProfileController extends GetxController {
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController lastnameEditingController = TextEditingController();
  TextEditingController firstnameEditingController = TextEditingController();
  TextEditingController accountTypeEditingController = TextEditingController();
  void patientPro() async {
    var scopedToken = await NetWorkHandler.getToken();
    PatientProfileModel patientProfileModel = PatientProfileModel(
        email: emailEditingController.text,
        password: passwordEditingController.text,
        lastname: lastnameEditingController.text,
        firstname: firstnameEditingController.text,
        accountType: accountTypeEditingController.text);
    
    // print("patientProfile func patientProfile para body -> \n" +
    //     patientProfileModelToJson(patientProfileModel));
    var response = await NetWorkHandler.post(
        patientProfileModelToJson(patientProfileModel), "/patientProfile",{
          "Content-type": "application/json",
          "authorization":scopedToken!});
    var data = json.decode(response.body);
    print(data["code"]);
    if (data["code"] == 1) {
      Get.to(const PatientHome());
    }
  }
}
