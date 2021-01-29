/*import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.id,
        this.account,
        this.name,
        this.gender,
        this.birther,
        this.perid,
        this.licenseVp,
        this.cId,
        this.permission,
        this.loginAttempt,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String account;
    String name;
    String gender;
    String birther;
    String perid;
    String licenseVp;
    int cId;
    String permission;
    int loginAttempt;
    String deletedAt;
    String createdAt;
    String updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        account: json["account"],
        name: json["name"],
        gender: json["gender"],
        birther: json["birther"],
        perid: json["perid"],
        licenseVp: json["license_VP"],
        cId: json["c_id"],
        permission: json["permission"],
        loginAttempt: json["login_attempt"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "account": account,
        "name": name,
        "gender": gender,
        "birther": birther,
        "perid": perid,
        "license_VP": licenseVp,
        "c_id": cId,
        "permission": permission,
        "login_attempt": loginAttempt,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}*/


import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.userId,
        this.id,
        this.title,
    });

    int userId;
    int id;
    String title;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}
