// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/login.dart';
import 'package:team_bash_project/Screens/Welcome/components/roundedButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color buttonColor = Color(0xff277BC0);
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      // color: Colors,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            'ND Telemedicine',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const Image(
          image: AssetImage('assets/img/welcome_doctor.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            width: deviceSize.width * 0.7,
            height: deviceSize.height * 0.06,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  primary: Colors.white,
                  padding: const EdgeInsets.all(10),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SizedBox(
            width: deviceSize.width * 0.7,
            height: deviceSize.height * 0.06,
            child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  primary: Colors.white,
                  padding: const EdgeInsets.all(10),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text(
                  'SIGNUP',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: deviceSize.width * 0.7,
          child: const RoundedButton(),
        ),
      ]),
    );
  }
}
