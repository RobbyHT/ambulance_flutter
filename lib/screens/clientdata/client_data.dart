import 'package:flutter/cupertino.dart';

class Clientdata {
  String name;
  String phone;
  String address;
  String discount;
  String other;

  Clientdata({
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.discount,
    @required this.other,
  });
}

List<Clientdata> CLIENT_DATA = [
  Clientdata(
      name: '林昊霆',
      phone: '09123456',
      address: '台北市中山區',
      discount: '身心障礙-200',
      other: '無'),
  Clientdata(
      name: '謝欣汝',
      phone: '09123456',
      address: '新北市蘆洲區',
      discount: '身心障礙-200',
      other: '無'),
  Clientdata(
      name: '洪季晴',
      phone: '09123456',
      address: '台北市信義區',
      discount: '身心障礙-200',
      other: '無'),
  Clientdata(
      name: '謝咏螢',
      phone: '09123456',
      address: '新北市泰山區',
      discount: '身心障礙-200',
      other: '無'),
  Clientdata(
      name: '朱雅筠',
      phone: '09123456',
      address: '新北市汐止區',
      discount: '身心障礙-200',
      other: '無'),
];
