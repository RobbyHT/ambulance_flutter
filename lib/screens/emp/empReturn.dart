import 'package:flutter/material.dart';

class EmpReturn extends StatelessWidget {
  dynamic name = 0;
  dynamic id = 0;
  dynamic position = 0;
  dynamic birth = 0;
  dynamic exptime = 0;
  dynamic gender = 0;
  dynamic license = 0;
  dynamic gkey = 0;

  EmpReturn(
      {key,
      this.name = 0,
      this.id = 0,
      this.position = 0,
      this.birth = 0,
      this.exptime = 0,
      this.gender = 0,
      this.license = 0,
      this.gkey = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(57, 72, 103, 10),
        appBar: AppBar(
          elevation: 0,
          title: Text('人員資料', style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(31, 60, 136, 40),
        ),
        body: Container(
            //width: 375,
            //height: 812,
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 72, 103, 0),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                  //大方塊定位
                  top: 102,
                  left: 35,
                  child: Container(
                      //大方塊長寬
                      width: 323,
                      height: 176,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 19,
                            left: 0,
                            child: Container(
                                //白框
                                width: 323,
                                height: 157,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                    bottomLeft: Radius.circular(22),
                                    bottomRight: Radius.circular(22),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ))),
                        Positioned(
                            top: 23,
                            left: 5,
                            child: Container(
                                //內框
                                width: 312,
                                height: 149,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(17),
                                    topRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17),
                                  ),
                                  color: Color.fromRGBO(206, 221, 240, 1),
                                ))),
                        Positioned(
                            top: 0,
                            left: 19,
                            child: Container(
                                width: 113,
                                height: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                    bottomLeft: Radius.circular(22),
                                    bottomRight: Radius.circular(22),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ))),
                      ]))),
              Positioned(
                  //內文資料
                  top: 112,
                  left: 63,
                  child: Container(
                      width: 260,
                      height: 155,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 6,
                            child: Text(
                              '$name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 35,
                            left: 0,
                            child: Text(
                              '$position',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 35,
                            left: 60,
                            child: Text(
                              '$gender',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 36,
                            left: 93,
                            child: Text(
                              '生日',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 36,
                            left: 173,
                            child: Text(
                              '$birth',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 87,
                            left: 93,
                            child: Text(
                              '證照',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 87,
                            left: 173,
                            child: Text(
                              '$license',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 138,
                            left: 93,
                            child: Text(
                              '公司金鑰',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 138,
                            left: 173,
                            child: Text(
                              '$gkey',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 61,
                            left: 93,
                            child: Text(
                              '身分證字號',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 61,
                            left: 173,
                            child: Text(
                              '$id',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 112,
                            left: 93,
                            child: Text(
                              '證照到期日',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 112,
                            left: 173,
                            child: Text(
                              '$exptime',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                      ]))),
              Positioned(
                  //下方確認列
                  top: 323,
                  left: 123,
                  child: Container(
                      width: 133,
                      height: 42,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 43,
                                height: 41,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(43, 41)),
                                ))),
                        Positioned(
                            top: 1,
                            left: 90,
                            child: Container(
                                width: 43,
                                height: 41,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(43, 41)),
                                ))),
                        Positioned(
                            top: 8,
                            left: 98,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    //確認
                                    bottom: -13,
                                    right: -15,
                                    child: IconButton(
                                      icon: Icon(Icons.check,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                  ),
                                ]))),
                        Positioned(
                            top: 6,
                            left: 4,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(),
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    //返回
                                    bottom: -15,
                                    right: -17,
                                    child: IconButton(
                                      icon: Icon(Icons.close,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                  ),
                                ]))),
                      ]))),
            ])),
      ),
    );
  }
}
