import 'package:ambulance_flutter/models/user.dart';
import 'package:flutter/material.dart';

class EmpReturn extends StatelessWidget {
  User user;

  EmpReturn({
    key,
    this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(57, 72, 103, 10),
        appBar: AppBar(
          elevation: 0,
          title: Text('員工資料', style: TextStyle(fontSize: 20)),
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
                      height: 250,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 19,
                            left: 0,
                            child: Container(
                                //白框
                                width: 323,
                                height: 190,
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
                                height: 180,
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
                      width: 280,
                      height: 190,
                      child: Stack(children: <Widget>[
                        Positioned(
                            top: 2,
                            left: 18,
                            child: Text(
                              user.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            )),
                        Positioned(
                            top: 25,
                            left: 210,
                            child: Text(
                              user.permission,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            )),
                        // Positioned(
                        //     top: 35,
                        //     left: 60,
                        //     child: Text(
                        //       user.gender,
                        //       textAlign: TextAlign.left,
                        //       style: TextStyle(
                        //           color: Color.fromRGBO(20, 39, 79, 1),
                        //           fontFamily: 'Roboto',
                        //           fontSize: 17,
                        //           letterSpacing:
                        //               0 /*percentages not used in flutter. defaulting to zero*/,
                        //           fontWeight: FontWeight.normal,
                        //           height: 1),
                        //     )),
                        Positioned(
                            top: 40,
                            left: 52,
                            child: Text(
                              '性別',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 40,
                            left: 100,
                            child: Text(
                              user.gender,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 70,
                            left: 52,
                            child: Text(
                              '生日',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 70,
                            left: 100,
                            child: Text(
                              user.birther,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 100,
                            left: 0,
                            child: Text(
                              '身分證字號',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 100,
                            left: 100,
                            child: Text(
                              user.perid,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        // Positioned(
                        //     top: 87,
                        //     left: 93,
                        //     child: Text(
                        //       '信箱',
                        //       textAlign: TextAlign.left,
                        //       style: TextStyle(
                        //           color: Color.fromRGBO(20, 39, 79, 1),
                        //           fontFamily: 'Roboto',
                        //           fontSize: 17,
                        //           letterSpacing:
                        //               0 /*percentages not used in flutter. defaulting to zero*/,
                        //           fontWeight: FontWeight.normal,
                        //           height: 1),
                        //     )),
                        // Positioned(
                        //     top: 87,
                        //     left: 173,
                        //     child: Text(
                        //       user.email,
                        //       textAlign: TextAlign.left,
                        //       style: TextStyle(
                        //           color: Color.fromRGBO(20, 39, 79, 1),
                        //           fontFamily: 'Roboto',
                        //           fontSize: 17,
                        //           letterSpacing:
                        //               0 /*percentages not used in flutter. defaulting to zero*/,
                        //           fontWeight: FontWeight.normal,
                        //           height: 1),
                        //     )),
                        Positioned(
                            top: 130,
                            left: 52,
                            child: Text(
                              '電話',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 130,
                            left: 100,
                            child: Text(
                              user.telphone,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 160,
                            left: 19,
                            child: Text(
                              '建立日期',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 160,
                            left: 100,
                            child: Text(
                              user.createdAt,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 79, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 17,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                      ]))),
            ])),
      ),
    );
  }
}
