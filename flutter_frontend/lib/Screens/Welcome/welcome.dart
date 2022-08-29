import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/body.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const color = Color(0xffF5E8E4);
    return const Scaffold(
      backgroundColor: color,
      body: Body(),
    );
  }
}
