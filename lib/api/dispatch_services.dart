import 'dart:convert';

import 'package:ambulance_flutter/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class DispatchRepo {
  Future<List<Dispatch>> getDispatchList();
  //Future<String> insDispatch();
}

class DispatchServices implements DispatchRepo {
  /*static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_USERS = '/albums';*/

  static const _baseUrl =
      '127.0.0.1:8000'; //不要接其他目錄127.0.0.1:8000/api -> 這樣就會出錯
  static const String _DISPATCHS = '/api/dispatch'; //若有其他目錄請寫在這裡
  @override
  Future<List<Dispatch>> getDispatchList() async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS);
    Response response = await http.get(uri);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<Response> insDispatch(Dispatch dispatch) async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = "application/x-www-form-urlencoded";

    Response response = await http.post(uri, headers: headersMap, body: {
      "d_date": dispatch.dDate,
      "d_time": dispatch.dTime,
      "start": dispatch.start,
      "end": dispatch.end,
      "o2": dispatch.o2.toString(),
      "elevator": dispatch.elevator.toString(),
      "special": dispatch.special.toString(),
      "weight": dispatch.weight.toString(),
      "phone": dispatch.phone,
      "remark": dispatch.remark,
      "user_id": dispatch.userId.toString(),
      "state": dispatch.state.toString(),
    });

    return response;
  }
}
