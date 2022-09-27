import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/Screens/login/controller/login_controller.dart';

import '../../service/netWorkHandler.dart';

class PatientHome extends StatefulWidget {
   PatientHome({Key? key}) : super(key: key);
  // final loginController = Get.find<LoginController>();
  static const sampleImageURL =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/1879px-Lion_d%27Afrique.jpg";

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  final sampleName = "Jadon";
@override
  void initState(){
    super.initState();
    checkLogin();

  }
  void checkLogin()async {
    String? token = await NetWorkHandler.getToken();
    print('token in patienthome page');
    print(token);

  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: deviceSize.width,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  print("Pressed patient profile pic");
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: CachedNetworkImage(
                      imageUrl: PatientHome.sampleImageURL,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Text(
                'hi, $sampleName',// loginController.emailEditingController.text,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'),
                textAlign: TextAlign.center,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                  size: 36,
                ),
                onPressed: () {
                  print("Message bubble pressed");
                },
              ),
            ],
          ),
          const SizedBox(
            height: 64,
          ),
          _button(
              buttonText: "Today's health condition",
              onPressed: () {
                print("Pressed first button");
              }),
          _button(buttonText: "Book an Appointment"),
          _button(buttonText: "My Appointment"),
          _button(buttonText: "My Record"),
          _button(buttonText: "My Prescription"),
        ]),
      ),
    );
  }

  Widget _button({required String buttonText, VoidCallback? onPressed}) {
    return CupertinoButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
          ),
        ));
  }
}
