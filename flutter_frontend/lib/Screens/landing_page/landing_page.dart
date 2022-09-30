import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../service/netWorkHandler.dart';
import 'controller/landingpage_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final landingPageController = Get.put(LandingPageController());
  // LandingPageController inst = Get.find();
  

  @override
  Widget build(BuildContext context) {
    // return const FutureBuilder(
    //   builder: (BuildContext context, AsymcSmapsshot<String> model));
    return Scaffold(
      // body: if(landingPageController),
      // body: Center(child: Text(landingPageController.token.value)),
    );
  }
}

