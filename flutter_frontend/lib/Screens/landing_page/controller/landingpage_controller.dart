import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class LandingPageController extends GetxController {
  RxString token = ''.obs;
  RxBool loggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    var scopedToken = await NetWorkHandler.getToken();
    if (scopedToken != null) {
      final parts = scopedToken.split('.');
      final payload = parts[1];
      final String decoded_data = B64urlEncRfc7515.decodeUtf8(payload);
      print("decoded_data : $decoded_data");
      var data = json.decode(decoded_data);
      print(data["id"]);
      var id = data["id"];
      token.value = data["id"];
      loggedIn.value = true;
      var response = await NetWorkHandler.get("/login/user-detail?id=$id", {
          "Content-type": "application/json",
          "authorization":scopedToken});
      print("response body:");
      print(response.body);
    }
  }

  
}
