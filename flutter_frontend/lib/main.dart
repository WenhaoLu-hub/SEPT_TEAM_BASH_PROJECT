import 'package:flutter/material.dart';
import 'package:team_bash_project/Screens/Welcome/welcome.dart';

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
      home: const Welcome(),
    );
  }
}
