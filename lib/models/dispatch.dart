class Dispatch {
  Dispatch({
    this.d_date,
    this.d_time,
    this.start,
    this.end,
    this.o2,
    this.elevator,
    this.special,
    this.weight,
    this.phone,
    this.remark,
    this.user_id,
    this.state,
  });

  String d_date;
  String d_time;
  String start;
  String end;
  int o2;
  int elevator;
  int special;
  double weight;
  String phone;
  String remark;
  int user_id;
  int state;

  // factory Dispath.fromJson(Map<String, dynamic> json) => Dispath(
  //       d_date: json["d_date"],
  //       id: json["id"],
  //       title: json["title"],
  //     );

  Map<String, dynamic> toJson() => {
        "d_date": d_date,
        "d_time": d_time,
        "start": start,
        "end": end,
        "o2": o2,
        "elevator": elevator,
        "special": special,
        "weight": weight,
        "phone": phone,
        "remark": remark,
        "user_id": user_id,
        "state": state,
      };
}
