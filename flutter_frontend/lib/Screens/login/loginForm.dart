import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/signup/signup.dart';

import '../components/customizedTextButton.dart';
import '../components/roundedButton.dart';
import '../components/textFieldContainer.dart';
import '../reset_password/reset_password.dart';
import 'controller/login_controller.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({Key? key}) : super(key: key);

  @override
  LoginFormPageState createState() => LoginFormPageState();
}

class LoginFormPageState extends State<LoginFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  var loginController = Get.put(LoginController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      loginController.login();
      print("submit successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'email',
                controller: loginController.emailEditingController,
                hintText: "name@example.com",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'email can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 30) {
                    return "Too long";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_username)) {
                    return "please type the correct email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _password = text),
                title: 'password',
                controller: loginController.passwordEditingController,
                hintText: "password",
                isPassword: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'password can\'t be empty';
                  }

                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 16) {
                    return "Too long";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomizedTextButton(
                    label: "Fortet password?",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    press: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    },
                    color: const Color(0xff164276),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              RoundedButton(
                press: () {
                  _submit();
                },
                text: 'Submit',
              ),
            ],
          )),
    );
  }
}
