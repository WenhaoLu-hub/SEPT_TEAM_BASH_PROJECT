import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetWorkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static void post(var body, String endPoint) async {
    var response = await client.post(buildUri(endPoint), body: body);
    print("api call -> \n"+response.body);
  }

  static Uri buildUri(String endPoint) {
    String host = "http://localhost:8080";
    final apiPath = host + endPoint;
    return Uri.parse(apiPath);
  }

  static void storeTocken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getTocken(String token) async {
    return await storage.read(key: "token");
  }
}
