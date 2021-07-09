import 'package:flutter/cupertino.dart';

class Clientdata {
  String name;
  String phone;

  Clientdata({
    @required this.name,
    @required this.phone,
  });
}

List<Clientdata> CLIENT_DATA = [
  Clientdata(name: '林昊霆', phone: '09123456'),
  Clientdata(name: '謝欣汝', phone: '09123456'),
  Clientdata(name: '洪季晴', phone: '09123456'),
  Clientdata(name: '謝咏螢', phone: '09123456'),
  Clientdata(name: '朱雅筠', phone: '09123456'),
];
