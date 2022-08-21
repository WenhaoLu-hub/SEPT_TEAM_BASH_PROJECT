import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/body.dart';
import 'package:team_bash_project/stateful.dart';
import '../../stateful.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: MyWidget(),
    );
  }
}
