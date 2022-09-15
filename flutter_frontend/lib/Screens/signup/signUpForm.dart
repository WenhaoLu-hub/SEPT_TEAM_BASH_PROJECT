import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/roundedButton.dart';
import '../components/textFieldContainer.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

String? _dropdownValue;
var list = <String>["Doctor", "Patient"];

class SignUpFormState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPasswword = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _username = text),
                title: 'email',
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
                height: 20,
              ),
              DropDownButtonSelector(
                accountType: "account type",
                validator: (value) =>
                    value == null ? "please the account type" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _password = text),
                title: 'password',
                hintText: "password",
                isPassword: true,
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
                height: 30,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _confirmPasswword = text),
                title: 'confirm password',
                hintText: "Confirm password",
                isPassword: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'confirm password can\'t be empty';
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
                height: 30,
              ),
              RoundedButton(
                press: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  // if (_formKey.currentState!.validate()) {
                  //   // If the form is valid, display a snackbar. In the real world,
                  //   // you'd often call a server or save the information in a database.\
                  //   return
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Processing Data')),
                  //   );
                  // }
                  _submit();
                },
                text: 'Submit',
              ),
            ],
          )),
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

// ignore: camel_case_extensions
extension extString on String {
  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class DropDownButtonSelector extends StatefulWidget {
  final String? Function(String?)? validator;
  final String accountType;
  const DropDownButtonSelector(
      {Key? key, this.validator, required this.accountType})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DropDownButtonState();
  }
}

class _DropDownButtonState extends State<DropDownButtonSelector> {
  // String? Function(String?)? validator;
  // String? accountType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // "Account Type",
          widget.accountType,
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                  color: Color(0xff293462),
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          child: DropdownButtonFormField(
            validator: widget.validator,
            decoration: const InputDecoration(
                enabled: true,
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Color(0xffdfe8f3),
                ))),

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

            items: list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (String? value) {
              setState(
                () => _dropdownValue = value!,
                // valdator:
              );
            },
          ),
        ),
      ],
    );
  }
}
