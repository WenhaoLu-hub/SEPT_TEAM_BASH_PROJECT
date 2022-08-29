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
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            const SizedBox(height: 40),
            SizedBox(
                width: deviceSize.width * 0.7,
                child: RoundedButton(
                  text: 'LOGIN',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
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
                        return Login();
                      },
                    ),
                  );
                },
              ),
            )
          ]),
    );
  }
}
