// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/signup/signup.dart';

import '../components/textFieldContainer.dart';

class Login extends StatelessWidget {
  final VoidCallback showRegisterPage;
  const Login({Key? key, required this.showRegisterPage}) : super(key: key);

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
            const TextFieldContainer(
              title: "username",
              hintText: "your username",
              isPassword: false,
            ),
            const SizedBox(
              height: 30,
            ),
            // _labelTextInput("Password", "your password", true),
            // const TextFieldContainer(child: TextField(),),
            const TextFieldContainer(
              title: "Password",
              hintText: "your password",
              isPassword: true,
            ),
            const SizedBox(
              height: 60,
            ),
            _loginBtn(),
            const SizedBox(
              height: 50,
            ),
            _signUpLabel(
                "Dont's have an account yet?", const Color(0xff909090)),
            // const SizedBox(
            //   height: 10,
            // ),
            // _signUpLabel("Sign Up", const Color(0xff164276)),
            // _signUpButton(),
            CustomizedTextButton(
              label: "Sign Up Now",
              fontSize: 18,
              fontWeight: FontWeight.w800,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              color: const Color(0xff164276),
            ),
            // TextButton(
            //   onPressed: null,
            //   child: Text(
            //     "Sign Up Now",
            //     style: GoogleFonts.josefinSans(
            //       color: const Color(0xff164276),
            //       fontWeight: FontWeight.w800,
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}

Widget _TextButton(String label, Color textColor, FontWeight fontweight) {
  return TextButton(
    onPressed: null,
    child: Text(
      "Sign Up Now",
      style: GoogleFonts.josefinSans(
        color: const Color(0xff164276),
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );
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

class CustomizedTextButton extends StatelessWidget {
  final String label;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback press;
  final double fontSize;

  const CustomizedTextButton(
      {super.key,
      required this.label,
      required this.press,
      required this.color,
      required this.fontWeight,
      required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        label,
        style: GoogleFonts.josefinSans(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
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
