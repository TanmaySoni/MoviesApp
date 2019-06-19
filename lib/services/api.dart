import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<dynamic> getRequest(String url) {
    try {
      return http.get(url).then((http.Response response) {
        final res = json.decode(response.body);
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw ("Error while fetching data");
        }
        return res;
      });
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postRequest(String url) {
    return http.post(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return res;
    });
  }
}
