import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

class UserRepository {
  var singin = false;

  Future<void> signIn(String account, String password) async {
    final queryParameters = {
      'account': account,
      'password': password,
    };
    final uri = Uri.http('http://127.0.0.1:8000/api/login', '/path', queryParameters);
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

  Future<String> getUser() async {
    final response =
        await http.get('http://127.0.0.1:8000/api/user');
    if (response.statusCode == 200) {
      //return User.fromJson(jsonDecode(response.body));
      return User.fromJson(jsonDecode(response.body)).name;
    } else {
      throw Exception('Failed to load User');
    }
  }
}