import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';

class LandingPageController extends GetxController {
  RxString? token;
  RxBool loggedIn = false.obs;
  final key = Key.fromUtf8('put32charactershereeeeeeeeeeeee!'); //32 chars
  final iv = IV.fromUtf8('put16characters!'); //16 chars

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    var scopedToken = await NetWorkHandler.getToken();
    if (scopedToken != null) {
      final key = Key.fromUtf8('my 32 length key................');
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));

      token?.value = scopedToken;
      loggedIn.value = true;
      // var response = NetWorkHandler.get("/login/user-detail", token?.value);
    }
  }

  
}
