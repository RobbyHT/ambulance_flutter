import 'dart:convert';

List<Dispatch> dispatchFromJson(String str) =>
    List<Dispatch>.from(json.decode(str).map((x) => Dispatch.fromJson(x)));

String dispatchToJson(List<Dispatch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dispatch {
  Dispatch({
    this.id,
    this.start,
    this.end,
    this.dDate,
    this.dTime,
    this.o2,
    this.elevator,
    this.special,
    this.weight,
    this.phone,
    this.remark,
    this.userId,
    this.state,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String start;
  String end;
  String dDate;
  String dTime;
  int o2;
  int elevator;
  int special;
  String weight;
  String phone;
  String remark;
  int userId;
  int state;
  DateTime createdAt;
  DateTime updatedAt;

  // factory Dispath.fromJson(Map<String, dynamic> json) => Dispath(
  //       d_date: json["d_date"],
  //       id: json["id"],
  //       title: json["title"],
  //     );

  factory Dispatch.fromJson(Map<String, dynamic> json) => Dispatch(
        id: json["id"],
        start: json["start"],
        end: json["end"],
        dDate: json["d_date"],
        dTime: json["d_time"],
        o2: json["o2"],
        elevator: json["elevator"],
        special: json["special"],
        weight: json["weight"],
        phone: json["phone"],
        remark: json["remark"],
        userId: json["user_id"],
        state: json["state"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "d_date": dDate,
        "d_time": dTime,
        "o2": o2,
        "elevator": elevator,
        "special": special,
        "weight": weight,
        "phone": phone,
        "remark": remark,
        "user_id": userId,
        "state": state,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
