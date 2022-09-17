import 'package:flutter/material.dart';
import '../components/roundedButton.dart';
import '../login/login.dart';
import '../signup/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    const color = Color(0xffF5E8E4);
    return  Scaffold(
      backgroundColor: color,
      body: Container(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: deviceSize.width * 0.5,
              image: const AssetImage('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'ND \n Telemedicine',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 70),
            SizedBox(
                width: deviceSize.width * 0.7,
                child: RoundedButton(
                  text: 'LOGIN',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return  const Login();
                        },
                      ),
                    );
                  },
                )),
            const SizedBox(height: 20),
            SizedBox(
              width: deviceSize.width * 0.7,
              child: RoundedButton(
                text: 'SIGNUP',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUp();
                      },
                    ),
                  );
                },
              ),
            )
          ]),
    )
    );
  }
}
