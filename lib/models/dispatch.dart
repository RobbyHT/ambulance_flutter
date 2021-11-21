import 'dart:convert';

List<Dispatch> dispatchFromJson(String str) =>
    List<Dispatch>.from(json.decode(str).map((x) => Dispatch.fromJson(x)));

String dispatchToJson(List<Dispatch> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dispatch {
  Dispatch({
    this.id,
    this.start,
    this.startLat,
    this.startLng,
    this.end,
    this.endLat,
    this.endLng,
    this.dDate,
    this.dTime,
    this.o2,
    this.elevator,
    this.special,
    this.weight,
    this.phone,
    this.remark,
    this.driverId,
    this.state,
    this.userId,
    this.distance,
    this.duration,
    this.totalPay,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String start;
  double startLat;
  double startLng;
  String end;
  double endLat;
  double endLng;
  String dDate;
  String dTime;
  bool o2;
  bool elevator;
  bool special;
  String weight;
  String phone;
  String remark;
  int driverId;
  int state;
  int userId;
  double distance;
  int duration;
  int totalPay;
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
        startLat: double.parse(json["start_lat"]),
        startLng: double.parse(json["start_lng"]),
        end: json["end"],
        endLat: double.parse(json["end_lat"]),
        endLng: double.parse(json["end_lng"]),
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
        distance: json["distance"],
        duration: json["duration"],
        totalPay: json["totalPay"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "start_lat": startLat,
        "start_lng": startLng,
        "end": end,
        "end_lat": endLat,
        "end_lng": endLng,
        "d_date": dDate,
        "d_time": dTime,
        "o2": o2,
        "elevator": elevator,
        "special": special,
        "weight": weight,
        "phone": phone,
        "remark": remark,
        "driver_id": driverId,
        "state": state,
        "user_id": userId,
        "distance": distance,
        "duration": duration,
        "totalPay": totalPay,
      };
}
