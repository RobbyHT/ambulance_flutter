import 'package:meta/meta.dart';

class Cardata {
  String name;
  String maturity;
  String cleaners;
  String maintain;

  Cardata({
    @required this.name,
    @required this.maturity,
    @required this.cleaners,
    @required this.maintain,
  });
}

List<Cardata> CAR_DATA = [
  Cardata(
      name: "7768-AU",
      maturity: "2028",
      cleaners: "2021/10/11",
      maintain: "2021/09/08"),
  Cardata(
      name: "6891-AD",
      maturity: "2023",
      cleaners: "2021/10/13",
      maintain: "2021/06/03"),
  Cardata(
      name: "6985-AC",
      maturity: "2023",
      cleaners: "2021/10/15",
      maintain: "2019/05/28"),
  Cardata(
      name: "7564-BP",
      maturity: "2028",
      cleaners: "2021/10/20",
      maintain: "2018/01/04"),
  Cardata(
      name: "8930-BG",
      maturity: "2029",
      cleaners: "2021/10/23",
      maintain: "2020/03/25"),
  Cardata(
      name: "8351-BU",
      maturity: "2028",
      cleaners: "2021/10/26",
      maintain: "2019/04/03"),
  Cardata(
      name: "7251-BS",
      maturity: "2028",
      cleaners: "2021/11/01",
      maintain: "2021/02/25"),
];
