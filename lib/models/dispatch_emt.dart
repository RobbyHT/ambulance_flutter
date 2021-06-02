import 'dart:convert';

List<DispatchEMT> dispatchEMTFromJson(String str) => List<DispatchEMT>.from(
    json.decode(str).map((x) => DispatchEMT.fromJson(x)));

String dispatchEMTToJson(List<DispatchEMT> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DispatchEMT {
  DispatchEMT({
    this.id,
    this.dispatchId,
    this.userId,
    this.state,
  });

  int id;
  int dispatchId;
  List<int> userId;
  int state;

  factory DispatchEMT.fromJson(Map<String, dynamic> json) => DispatchEMT(
        id: json["id"],
        dispatchId: json["dispatch_id"],
        userId: json["user_id"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dispatch_id": dispatchId,
        "user_id": userId,
        "state": state,
      };
}
