// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/login/login.dart';

import '../components/customizedTextButton.dart';
import '../components/textFieldContainer.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
                height: 80,
              ),
              _logo(context),
              const SizedBox(
                height: 40,
              ),
              _loginLabel(),
              const SizedBox(
                height: 60,
              ),
              const TextFieldContainer(
                title: "username",
                hintText: "your username",
                isPassword: false,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextFieldContainer(
                title: "Password",
                hintText: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextFieldContainer(
                title: "Confirm Password",
                hintText: "Confirm Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 50,
              ),
              _loginBtn(),
              const SizedBox(
                height: 50,
              ),
              _signUpLabel(
                  "Already have an account?", const Color(0xff909090)),
              CustomizedTextButton(
                label: "Login Now",
                fontSize: 18,
                fontWeight: FontWeight.w800,
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Login(),
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

Widget _loginBtn() {
  return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          color: Color(0xff008fff),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const TextButton(
        onPressed: null,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ));
}

Widget _loginLabel() {
  return Center(
    child: Text(
      "Sign Up",
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
