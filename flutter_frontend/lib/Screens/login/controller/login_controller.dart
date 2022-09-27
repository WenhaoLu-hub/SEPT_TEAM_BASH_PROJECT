import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/PatientHomepage/patientHome.dart';
import 'package:team_bash_project/Screens/landing_page/landing_page.dart';
import 'package:team_bash_project/Screens/login/model/login_model.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';

class LoginController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  void login() async {
    LoginModel loginModel = LoginModel(
        email: emailEditingController.text,
        password: passwordEditingController.text);
    print("login func -> \n" + loginModelToJson(loginModel));
    var email = emailEditingController.text;
    var password = passwordEditingController.text;
    var response = await NetWorkHandler.post(
        loginModelToJson(loginModel), "/login?email=$email&password=$password");
    //validate the data, successfully
    if (response.statusCode == 200) {
      print(response.body);
      await NetWorkHandler.storeToken(response.body);
      Get.offAll(() => LandingPage());
    } else {
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: 'Error',
        middleText: 'Incorrect email or password!',
        textConfirm: 'Okay',
        confirm: OutlinedButton.icon(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.check,
            color: Colors.blue,
          ),
          label: const Text(
            'Okay',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
      print(response.statusCode);
    }
  }
}
