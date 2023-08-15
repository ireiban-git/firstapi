import 'package:http/http.dart' as http;
import 'package:firstapi/model/usuario.dart';

class UsuarioService {
  Future<List<Usuario>?> getUsuarios() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return usuarioFromJson(json);
    } else {
      return [];
    }
  }
}
