import 'dart:convert';

List<CountData> countDataFromJson(String str) =>
    List<CountData>.from(json.decode(str).map((x) => CountData.fromJson(x)));

String countDataToJson(List<CountData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountData {
  CountData({
    this.key,
    this.count,
  });

  String key;
  int count;

  factory CountData.fromJson(Map<String, dynamic> json) => CountData(
        key: json["key"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "count": count,
      };
}
