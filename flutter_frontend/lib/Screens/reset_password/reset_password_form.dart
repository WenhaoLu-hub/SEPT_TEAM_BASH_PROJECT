import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/reset_password/controller/reset_password_controller.dart';
import '../components/roundedButton.dart';


class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);
  @override
  ResetPasswordFormState createState() => ResetPasswordFormState();
}

class ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  var resetPasswordController = Get.put(ResetPasswordController());
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // signupController.accountTypeEditingController.text = _dropdownValue!;
      _formKey.currentState!.save();
     resetPasswordController.reset_pass();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              TextFormField(
                controller: resetPasswordController.emailEditingController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'email can\'t be empty';
                  }
                  if (text.length < 8) {
                    return 'Too short';
                  }
                  if (text.length > 30) {
                    return "Too long";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_email)) {
                    return "please type the correct email";
                  }
                  return null;
                },
                onChanged: (value) => setState(
                  () => _email = value,
                ),
                cursorColor: const Color.fromARGB(255, 100, 94, 94),
                decoration: InputDecoration(
                    hintText: "name@example.com",
                    hintStyle: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 86, 92, 98),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffdfe8f3)),
                    )),
              ),
              const SizedBox(
                height: 60,
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

