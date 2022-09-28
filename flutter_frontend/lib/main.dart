import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:team_bash_project/Screens/Welcome/welcome.dart';
import 'package:team_bash_project/Screens/landing_page/landing_page.dart';
import 'package:team_bash_project/Screens/login/login.dart';
import 'package:team_bash_project/Screens/patientHomepage/patientHome.dart';
import 'package:team_bash_project/Screens/signup/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SEPT_Project',
      theme: ThemeData(platform:TargetPlatform.iOS,),
      getPages: [
        GetPage(name:"/home",page:()=>const Welcome()),
        GetPage(name:"/login",page:()=>const Login()),
        GetPage(name:"/signup",page:()=>const SignUp()),
        GetPage(name:"/landingpage",page:()=>const LandingPage()),
        GetPage(name:"/patient",page:()=> PatientHome()),
      ],
      initialRoute: '/home',
      // home: const Welcome(),
    );
  }
}
