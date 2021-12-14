import 'dart:convert';

List<NewsData> newsDataFromJson(String str) =>
    List<NewsData>.from(json.decode(str).map((x) => NewsData.fromJson(x)));

String newsDataToJson(List<NewsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsData {
  NewsData({
    this.title,
    this.content,
    this.created_at,
  });

  String title;
  String content;
  String created_at;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        title: json["title"],
        content: json["content"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "created_at": created_at,
      };
}
