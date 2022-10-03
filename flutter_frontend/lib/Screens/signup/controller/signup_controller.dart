import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/login/login.dart';
import 'package:team_bash_project/Screens/login/model/user.dart';
import 'package:team_bash_project/Screens/signup/model/signup_model.dart';
import 'package:team_bash_project/Screens/signup/signUpForm.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';


final signUpController = Get.put(const SignUpFormPage());

class SignupController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController accountTypeEditingController = TextEditingController();
  TextEditingController doctorEditingController = TextEditingController();
  void signup() async {
    SignupModel signupModel = SignupModel(
        email: emailEditingController.text,
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        password: passwordEditingController.text,
        accountType: accountTypeEditingController.text,
        doctor_id: doctorEditingController.text);
    print(
        "signup func signup para body -> \n" + signupModelToJson(signupModel));
    var response = await NetWorkHandler.post(signupModelToJson(signupModel),
        "/register", {"Content-type": "application/json"});

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

  Future<String> getDoctorId() async {
    final fullName = signUpController.GetDoctor();
    var response = await NetWorkHandler.get("/register/doctor/$fullName", {"Content-type": "application/json"});
    print(response.body);
    var data = json.decode(response.body);
    if(data["code"] == 0){
      return data["id"].toString();
    }
    return "";
  }

  Future<List<String?>?> getDoctors() async {
    // http://localhost:8080/register/doctors
    var response = await NetWorkHandler.get(
        "/register/doctors", {"Content-type": "application/json"});
    var data = json.decode(response.body);
    // print(data);
    var doctors = data['doctors'];
    final List<dynamic> doctor_names = doctors.map((e) => UserModel.fromJson(e).firstName + " " + UserModel.fromJson(e).lastName).toList();
    final List<String> list = doctor_names.map((e) => e.toString()).toList();
    // print("after casting doctor_name type : ${list.runtimeType}");
    print("doctor first name : ${list}");
    return list;
  }
}
