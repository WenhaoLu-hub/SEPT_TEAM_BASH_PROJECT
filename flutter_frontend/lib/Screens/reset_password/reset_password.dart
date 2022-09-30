import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/reset_password/reset_password_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
                "Reset your password?",
                style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                  color: Color(0xff164276),
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Enter your email to reset your password",
                style: GoogleFonts.openSans(textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,

                )),
              ),
              const ResetPasswordForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
