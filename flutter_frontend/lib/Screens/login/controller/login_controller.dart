import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:team_bash_project/Screens/login/model/login_model.dart';
import 'package:team_bash_project/service/api.dart';

class LoginController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  void login() {
    LoginModel loginModel = LoginModel(
        email: emailEditingController.text,
        password: passwordEditingController.text);
    print("login func -> \n" + loginModelToJson(loginModel));
    NetWorkHandler.post(loginModelToJson(loginModel), "/login");
  }
}
