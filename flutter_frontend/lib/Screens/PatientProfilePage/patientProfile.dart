import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/PatientProfilePage/patientProfileForm.dart';
import 'package:team_bash_project/Widgets/BlackBorderButton.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Patient Profile',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const patientProfileFormPage(),
              const SizedBox(
                height: 30,
              ),
              BlackBorderButton(buttonText: "Log out", onPressed: null)
            ]),
      ),
    ));
  }
}
