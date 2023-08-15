import 'package:http/http.dart' as http;
import 'dart:convert';

// const String baseUrl = 'http://localhost/WLog.NetEnvironment/rest';
const String baseUrl = 'http://10.0.2.2/WLog.NetEnvironment/rest';

class CustomService {
  var client = http.Client();

  Future<String> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var headers = {'Content-Type': 'application/json'};

    final response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      //throw exception and catch it in UI
      // return '';
      throw Exception('Failed to load data');
    }
  }
}
