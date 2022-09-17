import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/login/login.dart';
import 'package:team_bash_project/Screens/signup/model/signup_model.dart';
import 'package:team_bash_project/service/api.dart';


class SignupController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController accountTypeEditingController = TextEditingController();
  void signup() async {
    SignupModel signupModel = SignupModel(
        email: emailEditingController.text,
        password: passwordEditingController.text,
        accountType: accountTypeEditingController.text);
        print("signup func signup para body -> \n" + signupModelToJson(signupModel));
        var response =
        await NetWorkHandler.post(signupModelToJson(signupModel), "/register");
        var data = json.decode(response);
        print(data["code"]);
        if (data["code"] == 1) {
          Get.to(()=>const Login());
        } 
        
  }
}
