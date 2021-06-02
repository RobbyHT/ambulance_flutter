import 'package:ambulance_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'urlPath.dart';

abstract class UsersRepo {
  Future<List<User>> getUserList();
}

class UserServices implements UsersRepo {
  /*static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_USERS = '/albums';*/

  static const _baseUrl = UrlPath.PATH; //不要接其他目錄127.0.0.1:8000/api -> 這樣就會出錯
  static const String _GET_USERS = '/api/user'; //若有其他目錄請寫在這裡
  @override
  Future<List<User>> getUserList() async {
    Uri uri = new Uri.http(_baseUrl, _GET_USERS);
    Response response = await http.get(uri);
    List<User> users = userFromJson(response.body);
    return users;
  }

  Future<List<User>> getDriverList() async {
    Uri uri = new Uri.http(_baseUrl, '/api/userTake/driver');
    Response response = await http.get(uri);
    List<User> users = userFromJson(response.body);
    return users;
  }

  Future<List<User>> getEMTList() async {
    Uri uri = new Uri.http(_baseUrl, '/api/userTake/EMT');
    Response response = await http.get(uri);
    List<User> users = userFromJson(response.body);
    return users;
  }
}
