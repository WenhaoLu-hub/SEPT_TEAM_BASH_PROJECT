import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:team_bash_project/Screens/PatientHealthConditionPage/patientHealthCondition.dart';
import 'package:team_bash_project/Screens/PatientProfilePage/patientProfile.dart';
import 'package:team_bash_project/Screens/PatientProfilePage/patientProfileForm.dart';
import 'package:team_bash_project/Screens/Welcome/welcome.dart';

import 'Screens/PatientHomepage/patientHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEPT_Project',
      theme: ThemeData(),
      home: const PatientHome(),
    );
  }
}
