import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/reset_password/code_verification_form.dart';


class CodeVerification extends StatelessWidget {
  const CodeVerification({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                "We have sent a verification code to your email, please check it.",
                style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                  color: Color(0xff164276),
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                )),
              ),
              const SizedBox(
                height: 10,
              ),
            
              const CodeVerificationForm(),
            ],
          ),
        ),
      ),
    ));
  }
}