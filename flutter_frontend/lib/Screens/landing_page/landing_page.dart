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
  var landingPageController = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('home'),);
  }
}
