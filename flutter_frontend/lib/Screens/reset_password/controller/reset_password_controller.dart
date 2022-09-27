import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/login/login.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';

import '../code_verification.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController codeEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  // late int sendEmailStatus;
  void reset_pass() async {
    var email = emailEditingController.text;
    var response = await NetWorkHandler.get("/login/$email",null);
    // respnse.
    // sendEmailStatus = response.statusCode;
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.to(() => const CodeVerification());
    }
  }

  void reset_password() async {
    var code = codeEditingController.text;
    var newPassword = passwordEditingController.text;
    var response = await NetWorkHandler.post(
        null, "/login/resetPassword?verifyCode=$code&newPassword=$newPassword");
    Get.to(() => const Login());
  }
}
