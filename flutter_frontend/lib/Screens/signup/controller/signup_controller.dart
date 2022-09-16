import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:team_bash_project/Screens/login/model/login_model.dart';
import 'package:team_bash_project/Screens/signup/model/signup_model.dart';
import 'package:team_bash_project/Screens/signup/signup.dart';
import 'package:team_bash_project/service/api.dart';

import '../signUpForm.dart';

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
        await NetWorkHandler.post(signupModelToJson(signupModel), "/signup");
  }
}
