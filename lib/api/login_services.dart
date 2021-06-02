import 'dart:async';
import 'dart:convert';
import 'package:ambulance_flutter/db/user_lite.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:http/http.dart' as http;

import 'urlPath.dart';

class LoginServices {
  var singin = false;

  static LoginServices _init = new LoginServices.init();
  LoginServices.init();
  factory LoginServices() => _init;

  Future<String> signIn(String account, String password) async {
    final _baseUrl = UrlPath.PATH;
    final _path = '/api/login';
    final queryParameters = {
      'account': account,
      'password': password,
    };
    final uri = Uri.http(_baseUrl, _path, queryParameters);
    final response = await http.get(uri);

    Map<String, dynamic> userJson = json.decode(response.body);
    User user = User.fromJson(userJson);
    //final qq = await DBHelper.instance.insert(table, data);
    await DBHelper.instance.insert('userList', user);
    return user.permission;
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
