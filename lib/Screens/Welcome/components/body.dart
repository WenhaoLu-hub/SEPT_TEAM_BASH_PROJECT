// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color buttonColor = Color(0xff277BC0);
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'WELCOME TO BASH',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Image(
            image: AssetImage('assets/img/welcome_doctor.png'),
          ),
          TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor:buttonColor ,
                primary: Colors.white,
                padding: const EdgeInsets.all(20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('LOGIN')),
          TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor:buttonColor ,
                primary: Colors.white,
                padding: const EdgeInsets.all(20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('SIGNUP'))
        ]);
  }
}
