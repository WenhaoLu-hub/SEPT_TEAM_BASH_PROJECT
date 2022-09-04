import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          _logo(context),
          const SizedBox(
            height: 40,
          ),
          _loginLabel(),
        ],
      ),
    );
  }
}

Widget _logo(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Center(
    child: SizedBox(
      child: Image(
          width: size.width * 0.2,
          image: const AssetImage("assets/images/logo.png")),
    ),
  );
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
