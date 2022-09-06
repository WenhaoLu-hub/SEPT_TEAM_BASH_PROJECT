import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/roundedButton.dart';
import '../components/textFieldContainer.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<List> onSubmit;
  @override
  SignUpFormState createState() => SignUpFormState();
}
var list = <String>["Doctor", "Patient"];
class SignUpFormState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _confirmPasswword = '';
  
void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit([_username,_password,]);
    }}
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
                title: 'username',
                hintText: "Username",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }
                  if (text.length < 4) {
                    return 'Too short';
                  }
                  if (text.length > 12) {
                    return "Too long";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const DropDownButtonSelector(),
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
                    return 'Can\'t be empty';
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
                    return 'Can\'t be empty';
                  }
                  if (text != _password) {
                    return 'Password are not match';
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
                  //   return ;
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