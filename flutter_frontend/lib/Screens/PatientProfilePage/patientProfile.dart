import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final TextEditingController _othersControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      width: deviceSize.width,
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        SizedBox(
          height: 32,
        ),
        Text(
          'Patient Profile',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans'),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 60,
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(
        //       borderSide: BorderSide(color: Colors.black, width: 2),
        //     ),
        //   ),
        // ),
      ]),
    ));
  }
}
