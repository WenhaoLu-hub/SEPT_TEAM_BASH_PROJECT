import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/login/login.dart';
import 'package:team_bash_project/Screens/signup/model/signup_model.dart';
import 'package:team_bash_project/service/api.dart';

class SignupController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController accountTypeEditingController = TextEditingController();
  void signup() async {
    SignupModel signupModel = SignupModel(
        email: emailEditingController.text,
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        password: passwordEditingController.text,
        accountType: accountTypeEditingController.text);
    print(
        "signup func signup para body -> \n" + signupModelToJson(signupModel));
    var response =
        await NetWorkHandler.post(signupModelToJson(signupModel), "/register");
    // var data = json.decode(response);
    // print(data["code"]);
    if (response.statusCode == 200) {
      Get.to(() => const Login());
    } else {
      Get.defaultDialog(
        radius: 10.0,
        contentPadding: const EdgeInsets.all(20.0),
        title: 'Error',
        middleText: 'Email already exist!',
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
      print(response.body);
    }
  }
}
