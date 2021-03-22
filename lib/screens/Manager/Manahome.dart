import 'package:ambulance_flutter/screens/Manager/components/category_card.dart';
import 'package:ambulance_flutter/screens/Manager/manager_screen.dart';
import 'package:ambulance_flutter/screens/Manager/page/announce.dart';
import 'package:ambulance_flutter/screens/Manager/page/car.dart';
import 'package:ambulance_flutter/screens/Manager/page/emp.dart';
import 'package:ambulance_flutter/screens/Manager/page/stock.dart';
import 'package:flutter/material.dart';
class  ManaHome extends StatefulWidget {
  @override
  _ManaHomeState createState() => _ManaHomeState();
}

class _ManaHomeState extends State<ManaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //漂浮按鈕設定------------------------
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.home),
      //   backgroundColor: Color.fromRGBO(7, 13, 89, 1),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder:(context) {
      //       return ManagerScreen();
      //     }));
      //   },
      // ),
      // body: Center(
      //   child: screen.elementAt(currentTab),
      // ),
      // bottomNavigationBar: ManagerScreen(),
    );
  }
}