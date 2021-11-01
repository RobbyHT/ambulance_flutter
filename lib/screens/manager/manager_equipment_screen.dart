import 'package:flutter/material.dart';
import 'equipmentUI/box_equipment.dart';
import 'equipmentUI/car_equipment.dart';

class ManagerEquipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(text: '車內設備'),
      Tab(text: '急救箱配備'),
    ];

    final pages = [CarWidget(), BoxWidget()];
    return MaterialApp(
      debugShowCheckedModeBanner: false, //移除debug的標籤
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(31, 60, 136, 40),
            centerTitle: true,
            title: Text("設備管理"),
            bottom: TabBar(
              tabs: myTabs,
              indicatorColor: Color.fromRGBO(155, 164, 180, 5),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: TabBarView(
            children: <Widget>[CarWidget(), BoxWidget()],
          ),
        ),
      ),
    );
  }
}
