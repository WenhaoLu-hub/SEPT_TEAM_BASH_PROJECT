import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/reset_password/controller/reset_password_controller.dart';

import '../components/roundedButton.dart';
import '../components/textFieldContainer.dart';

class CodeVerificationForm extends StatefulWidget {
  const CodeVerificationForm({Key? key}) : super(key: key);
  @override
  CodeVerificationFormState createState() => CodeVerificationFormState();
}

class CodeVerificationFormState extends State<CodeVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  String _code = '';
  String _password = '';
  String _confirmPassword = '';
  var resetPasswordController = Get.put(ResetPasswordController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      resetPasswordController.reset_password();
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
                controller: resetPasswordController.codeEditingController,
                hintText: 'verification code',
                isPassword: false,
                onChanged: (value) => setState(() => _code = value),
                title: '4-digit code',
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'code can\'t be empty';
                  }
                  if (text.length != 4) {
                    return 'code has to be a 4-digit number';
                  }

                  if (!RegExp(r"[0-9]{4}$").hasMatch(_code)) {
                    return "code has to be a 4-digit number";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                controller: resetPasswordController.passwordEditingController,
                hintText: 'new passowrd',
                isPassword: true,
                onChanged: (value) => setState(() => _password = value),
                title: 'new password',
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
                height: 20,
              ),
              TextFieldContainer(
                hintText: 'confirm passowrd',
                isPassword: true,
                onChanged: (value) => setState(() => _confirmPassword = value),
                title: 'confirm passowrd',
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'password can\'t be empty';
                  }
                  if (text != _password) {
                    return 'password are not match';
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
                height: 40,
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
