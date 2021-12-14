import 'dart:convert';

import 'dart:developer';

// User userFromJson(String str) => User.fromJson(json.decode(str));
// String userToJson(User data) => json.encode(data.toJson());
List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  Customer({
    this.id,
    this.name,
    this.address,
    this.telphone,
    this.preferential,
    this.remark,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String address;
  String telphone;
  String preferential;
  String remark;
  String deletedAt;
  String createdAt;
  String updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        telphone: json["telphone"],
        preferential: json["preferential"],
        remark: json["remark"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "telphone": telphone,
        "preferential": preferential,
        "remark": remark,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
