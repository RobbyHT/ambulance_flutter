import 'dart:async';
import 'package:http/http.dart' as http;

class LoginServices {
  var singin = false;

  Future<void> signIn(String account, String password) async {
    final _baseUrl = 'http://127.0.0.1:8000';
    final _path = '/api/login';
    final queryParameters = {
      'account': account,
      'password': password,
    };
    final uri = Uri.http(_baseUrl, _path, queryParameters);
    final response =
        await http.get(uri);

    return response.body;
  }

  Future<bool> isSignedIn() async {
    return singin != false;
  }

  Future<void> signOut() async {
    singin = false;
  }

  /*Future<String> getUser() async {
    final response =
        await http.get('http://127.0.0.1:8000/api/user');
    if (response.statusCode == 200) {
      //return User.fromJson(jsonDecode(response.body));
      return User.fromJson(jsonDecode(response.body)).name;
    } else {
      throw Exception('Failed to load User');
    }
  }*/
}