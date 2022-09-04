// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            const SizedBox(
              height: 80,
            ),
            _logo(context),
            const SizedBox(
              height: 50,
            ),
            _loginLabel(),
            const SizedBox(
              height: 100,
            ),
            _labelTextInput("username", "your username", false),
            const SizedBox(
              height: 50,
            ),
            _labelTextInput("Password", "your password", true),
            const SizedBox(
              height: 50,
            ),
            _loginBtn(),
            const SizedBox(
              height: 80,
            ),
            _signUpLabel(
                "Dont's have an account yet?", const Color(0xff909090)),
            const SizedBox(
              height: 10,
            ),
            _signUpLabel("Sign Up", const Color(0xff164276)),
          ],
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

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
                color: Color(0xff293462),
                fontWeight: FontWeight.w600,
                fontSize: 20)),
      ),
      TextField(
        obscureText: isPassword,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                color: Color(0xffc5d2e1),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffdfe8f3)),
            )),
      )
    ],
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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  // ignore: use_key_in_widget_constructors
  const TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
        child: child);
  }
}
