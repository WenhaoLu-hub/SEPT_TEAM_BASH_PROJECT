import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/PatientHomepage/patientHome.dart';
import 'package:team_bash_project/Screens/login/model/login_model.dart';
import 'package:team_bash_project/service/api.dart';

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
    // var data = json.decode(response);
    await NetWorkHandler.storeTocken(response.body);
    // print(response);
    if (response.statusCode == 200) {
      Get.offAll(() => const PatientHome());
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

    // print("response:"+ data);
    // if (data["message"] == "UserNotExist") {
    //   //
    // }
  }
}
