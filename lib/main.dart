import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/components/body.dart';
import 'package:team_bash_project/Screens/Welcome/welcome.dart';
import 'package:team_bash_project/stateful.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEPT_Project',
      theme: ThemeData(),
      // home: MyWidget(),
      home: Welcome(),
    );
  }
}
