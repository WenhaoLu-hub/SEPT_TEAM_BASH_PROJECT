import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:team_bash_project/service/netWorkHandler.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class PatientPageController extends GetxController {
  RxString token = ''.obs;
  // RxString firstname = ''.obs;
  String firstname = '' ;

  Future<String> getName() async {
    var scopedToken = await NetWorkHandler.getToken();
    if (scopedToken != null) {
      final parts = scopedToken.split('.');
      final payload = parts[1];
      final String decoded_data = B64urlEncRfc7515.decodeUtf8(payload);
      var decoded_token = json.decode(decoded_data);
      var id = decoded_token["id"];
      token.value = decoded_token["id"];
      var response = await NetWorkHandler.get("/login/user-detail?id=$id", {
          "Content-type": "application/json",
          "authorization":scopedToken});
      // print("response body:");
      // print(response.body);
      var data = json.decode(response.body);
      print(data['user']['firstName']);
      // print("data-> ");
      // print(data['firstName']['firstName']);
      firstname = data['user']['firstName'];
      print("firstname ${firstname}");
      return firstname;
    }
    return firstname;
  }

  
}
