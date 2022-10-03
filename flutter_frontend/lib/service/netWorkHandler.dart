import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetWorkHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static Future<http.Response> post(var body, String endPoint,Map<String, String>? headers) async {
    print(buildUri(endPoint));
    var response = await client.post(buildUri(endPoint),
        body: body, 
        headers:headers);
        
    print(buildUri(endPoint));
    return response;
  }

  static Future<http.Response> get(String endPoint, Map<String, String>? headers) async {
    var response = await client.get(buildUri(endPoint),
        headers: headers);
    print(buildUri(endPoint));
    return response;
  }


  static Uri buildUri(String endPoint) {
    String host = "http://localhost:8080";
    final apiPath = host + endPoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
