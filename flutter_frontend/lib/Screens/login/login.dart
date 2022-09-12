// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/model/registeredUser.dart';
import 'package:team_bash_project/Screens/signup/signup.dart';

import '../components/customizedTextButton.dart';
import 'TextSubmitWidget.dart';
import 'loginForm.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              const SizedBox(
                height: 120,
              ),
              _logo(context),
              const SizedBox(
                height: 50,
              ),
              LoginFormPage(
                onSubmit: (List value) {
                  print(value.length);
                  RegisteredUser user = RegisteredUser(value[0], value[1]);
                  String jsonUser = jsonEncode(user);
                  print(jsonUser);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              _signUpLabel(
                  "Dont's have an account yet?", const Color(0xff909090)),
              CustomizedTextButton(
                label: "Sign Up Now",
                fontSize: 18,
                fontWeight: FontWeight.w800,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                color: const Color(0xff164276),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget _signUpLabel(String label, Color textColor) {
  return Text(
    label,
    style: GoogleFonts.josefinSans(
      textStyle: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w800,
        fontSize: 18,
      ),
    ),
  );
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "Login",
      style: GoogleFonts.josefinSans(
          textStyle: const TextStyle(
        color: Color(0xff164276),
        fontWeight: FontWeight.w900,
        fontSize: 40,
      )),
    ),
  );
}

Widget _logo(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return Center(
    child: SizedBox(
      child: Image(
        width: size.width * 0.25,
        image: const AssetImage('assets/images/logo.png'),
      ),
    ),
  );
}
