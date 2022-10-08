
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:team_bash_project/Screens/PatientProfilePage/controller/patientProfile_controller.dart';
import 'package:team_bash_project/Widgets/BlackBorderButton.dart';

import '../../Widgets/textFieldContainer.dart';

// ignore: camel_case_types
class patientProfileFormPage extends StatefulWidget {
  const patientProfileFormPage({Key? key}) : super(key: key);

  @override
  _patientProfileFormPageState createState() => _patientProfileFormPageState();
}

String? _dropdownValue;

// ignore: camel_case_types
class _patientProfileFormPageState extends State<patientProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  var patientProfileController = Get.put(PatientProfileController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      patientProfileController.accountTypeEditingController.text =
          _dropdownValue!;
      _formKey.currentState!.save();
      patientProfileController.patientPro();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 30,
              ),
              // ignore: prefer_const_constructors
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'Firstname',
                controller: patientProfileController.firstnameEditingController,
                hintText: "your firstname",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'firstname can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
                    return "Too long";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'Lastname',
                controller: patientProfileController.lastnameEditingController,
                hintText: "your lastname",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'lastname can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
                    return "Too long";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'email',
                controller: patientProfileController.emailEditingController,
                hintText: "name@example.com",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'email can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
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
                height: 30,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'password',
                controller: patientProfileController.emailEditingController,
                hintText: "password",
                isPassword: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'password can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
                    return "Too long";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              BlackBorderButton(buttonText: "submit", onPressed: _submit)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.isPassword,
    this.onChanged,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      obscureText: isPassword!,
      cursorColor: const Color.fromARGB(255, 100, 94, 94),
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
    );
  }
}
