
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:team_bash_project/Screens/components/dropDownSelector.dart';

import 'package:team_bash_project/Screens/signup/controller/signup_controller.dart';


import '../components/roundedButton.dart';
import '../components/textFieldContainer.dart';

String? _doctorDropdownValue;
String? _accountDropdownValue;
var accountList = <String>["Doctor", "Patient"];



class SignUpFormPage extends StatefulWidget {
  String GetDoctor(){
  print("_doctorDropdownValue ${_doctorDropdownValue!}");
  return _doctorDropdownValue!;
}
  const SignUpFormPage({Key? key}) : super(key: key);
  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';
  String _confirmPassword = '';
  var signupController = Get.put(SignupController());
  
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      signupController.accountTypeEditingController.text = _accountDropdownValue!;
      signupController.doctorEditingController.text = await signupController.getDoctorId();
      _formKey.currentState!.save();
      signupController.signup();
    }
  }
  
  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _email = text),
                title: 'email',
                controller: signupController.emailEditingController,
                hintText: "name@example.com",
                isPassword: false,
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
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _firstName = text),
                title: 'first name',
                controller: signupController.firstNameEditingController,
                hintText: "first name",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'first name can\'t be empty';
                  }
                  if (text.length < 2) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
                    return "Too long";
                  }
                  if (!RegExp(
                          r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$")
                      .hasMatch(_firstName)) {
                    return "please type the correct first name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _lastName = text),
                title: 'last name',
                controller: signupController.lastNameEditingController,
                hintText: "last name",
                isPassword: false,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'last name can\'t be empty';
                  }
                  if (text.length < 2) {
                    return 'Too short';
                  }
                  if (text.length > 20) {
                    return "Too long";
                  }
                  if (!RegExp(
                          r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{1,}$")
                      .hasMatch(_lastName)) {
                    return "please type the correct last name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropDownSelector(
                    title: "account type",
                    defaultValue: "choose your account type",
                    dropdownList: accountList,
                    validator: (value) =>
                        value == null ? "please choose an account type" : null,
                    selectValue: _accountDropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        value == null ? null : _accountDropdownValue = value;
                        print("dropdown value : ${value}");
                        print("changed value $_accountDropdownValue");
                      });
                    },
                  ),
              const SizedBox(
          height: 20,
        ),
        
         Visibility(
          visible: _accountDropdownValue == "Patient" ? true: false,
           child: FutureBuilder<dynamic>(
            future: signupController.getDoctors(),
             builder: 
             (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
            
                print(signupController.getDoctors().runtimeType);
                print(snapshot.error);
                      return const Text('Error');
                    } else if (snapshot.hasData) {
              return DropDownSelector(
                          title: "your personal doctor",
                          defaultValue: "choose your doctor",
                          dropdownList: snapshot.data,
                          validator: (value) =>
                              value == null ? "please choose a doctor" : null,
                          selectValue: _doctorDropdownValue,
                          onChanged: (String? value) {
                            setState(() {
                              value == null ? null : _doctorDropdownValue = value;
                              print("dropdown value : ${value}");
                              print("changed value $_doctorDropdownValue");
                            });
                          } ); }else {
                      return const Text('Empty data');
                    }},
             
           ),
         ),
              const SizedBox(
                height: 20,
              ),
              TextFieldContainer(
                onChanged: (text) => setState(() => _password = text),
                controller: signupController.passwordEditingController,
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
                onChanged: (text) => setState(() => _confirmPassword = text),
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

