// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/login/login.dart';

import '../components/customizedTextButton.dart';
import '../components/textFieldContainer.dart';

var list = <String>["Doctor", "Patient"];

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  // String valueChoose;
  // List listitem = ["doctor","patient"];

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
                title: "Username",
                hintText: "your username",
                isPassword: false,
              ),
              const SizedBox(
                height: 30,
              ),
              const DropDownButtonSelector(),
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
              _confirmBtn(),
              const SizedBox(
                height: 50,
              ),
              _signUpLabel("Already have an account?", const Color(0xff909090)),
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

class DropDownButtonSelector extends StatefulWidget {
  const DropDownButtonSelector({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DropDownButtonState();
  }
}

class _DropDownButtonState extends State<DropDownButtonSelector> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account Type",
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                  color: Color(0xff293462),
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          child: DropdownButton(
            isExpanded: true,
            hint: const Text("Choose your account type"),
            value: _dropdownValue,
            //  icon: const Icon(Icons.arrow_downward),
            // elevation: 16,
            style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            underline: Container(
              height: 1,
              color: const Color(0xffdfe8f3),
            ),
            items: list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _dropdownValue = value!;
              });
            },
          ),
        ),
      ],
    );
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

Widget _confirmBtn() {
  return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
          color: Color(0xff008fff),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: const TextButton(
        onPressed: null,
        child: Text(
          "Submit",
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
