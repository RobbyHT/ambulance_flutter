import 'dart:convert';
import 'dart:io';

import 'package:ambulance_flutter/models/count_data.dart';
import 'package:ambulance_flutter/models/dispatch_emt.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/models/news_data.dart';
import 'package:ambulance_flutter/screens/auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'urlPath.dart';

abstract class DispatchRepo {
  Future<List<Dispatch>> getAllDispatch();
  //Future<String> insDispatch();
}

class DispatchServices implements DispatchRepo {
  /*static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_USERS = '/albums';*/

  static const _baseUrl = UrlPath.PATH; //不要接其他目錄127.0.0.1:8000/api -> 這樣就會出錯
  static const String _DISPATCHS = '/api/dispatch'; //若有其他目錄請寫在這裡

  @override
  Future<List<Dispatch>> getAllDispatch() async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<List<Dispatch>> getDriverDispatch(id) async {
    Uri uri = new Uri.http(_baseUrl, '/api/driverTask/' + id);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<List<Dispatch>> getEmtDispatch(id) async {
    Uri uri = new Uri.http(_baseUrl, '/api/emtTask/' + id);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<List<Dispatch>> getOneDispatch(id) async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS + '/' + id);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<List<Dispatch>> checkDispatchTask() async {
    Uri uri = new Uri.http(_baseUrl, '/api/checkTask');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<Dispatch> dispatchs = dispatchFromJson(response.body);
    return dispatchs;
  }

  Future<Response> insDispatch(Dispatch dispatch) async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS);
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Response response = await http.post(uri,
        headers: headersMap, body: jsonEncode(dispatch.toJson()));

    EasyLoading.showSuccess('派車成功！');

    return response;
  }

  Future<Response> updDispatch(id, state) async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS + "/" + id.toString());
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = "application/x-www-form-urlencoded";
    Response response = await http
        .put(uri, headers: headersMap, body: {"state": state.toString()});

    return response;
  }

  Future<Response> delDispatch(id) async {
    Uri uri = new Uri.http(_baseUrl, _DISPATCHS + "/" + id.toString());
    Response response = await http.delete(uri);

    return response;
  }

  Future<Response> insDispatchEMT(DispatchEMT dispatchEMT) async {
    Uri uri = new Uri.http(_baseUrl, '/api/dispatchEMT');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Response response = await http.post(uri,
        headers: headersMap, body: jsonEncode(dispatchEMT.toJson()));
    return response;
  }

  Future<Response> insConsumablesRecord(int id, List arr) async {
    Uri uri = new Uri.http(_baseUrl, '/api/consumablesRecord');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Response response = await http.post(uri,
        headers: headersMap, body: jsonEncode({"arr": arr, "dispatchId": id}));
    return response;
  }

  Future<List<CountData>> dispatchCount(cId) async {
    Uri uri = new Uri.http(_baseUrl, '/api/dispatchCount');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Response response = await http.post(uri,
        headers: headersMap,
        body: jsonEncode(
            {"start_date": "", "end_date": "", "item": "user", "c_id": cId}));
    List<CountData> countDatas = countDataFromJson(response.body);
    return countDatas;
  }

  Future<List<CountData>> simgleDispatchCount(id) async {
    Uri uri = new Uri.http(_baseUrl, '/api/simgleDispatchCount');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Response response = await http.post(uri,
        headers: headersMap,
        body: jsonEncode({
          "start_date": "",
          "end_date": "",
          "item": "month",
          "user_id": id
        }));
    List<CountData> countDatas = countDataFromJson(response.body);
    return countDatas;
  }

  Future<List<NewsData>> newsData() async {
    Uri uri = new Uri.http(_baseUrl, '/api/news');
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Response response = await http.get(uri, headers: headersMap);
    List<NewsData> news = newsDataFromJson(response.body);
    return news;
  }
}
