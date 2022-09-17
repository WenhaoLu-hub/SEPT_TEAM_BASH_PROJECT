import 'dart:html';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../Widgets/textFieldContainer.dart';

// ignore: camel_case_types
class patientProfileFormPage extends StatefulWidget {
  const patientProfileFormPage({Key? key}) : super(key: key);

  @override
  State<patientProfileFormPage> createState() => _patientProfileFormPageState();
}

// ignore: camel_case_types
class _patientProfileFormPageState extends State<patientProfileFormPage> {
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      width: deviceSize.width,
      color: Colors.white,
      child: Row(
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
            controller: loginController.emailEditingController,
            hintText: "your firstname",
            isPassword: false,
          ),
        ],
      ),
    ));
  }
}
