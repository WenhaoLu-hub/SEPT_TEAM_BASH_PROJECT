import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/roundedButton.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: deviceSize.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Hi',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
              textAlign: TextAlign.center,
            ),
          ]),
    ));
  }
}
