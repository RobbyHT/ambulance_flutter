import 'dart:async';
import 'package:ambulance_flutter/home.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  var singin = false;

  static LoginServices _init = new LoginServices.init();
  LoginServices.init();
  factory LoginServices() => _init;

  Future<bool> signIn(String account, String password) async {
    final _baseUrl = '127.0.0.1:8000';
    final _path = '/api/login';
    final queryParameters = {
      'account': account,
      'password': password,
    };
    final uri = Uri.http(_baseUrl, _path, queryParameters);
    final response =
        await http.get(uri);

    //print(response.body);
    return response.body == 'true';
    
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