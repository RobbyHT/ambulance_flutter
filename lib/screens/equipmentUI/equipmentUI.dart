import 'package:ambulance_flutter/screens/equipmentUI/components/box_equipment.dart';
import 'package:ambulance_flutter/screens/equipmentUI/components/car_equipment.dart';

import 'package:flutter/material.dart';

class equipmentUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final List<Tab> myTabs = <Tab>[
    Tab(text: '車內設備'),
    Tab(text: '急救箱配備'),
  ];

  final pages = [CarWidget(), BoxWidget()];
    return MaterialApp(
      debugShowCheckedModeBanner: false,//移除debug的標籤
      home:DefaultTabController(length: myTabs.length,
      child: Scaffold(appBar: AppBar(
          backgroundColor: (Color.fromRGBO(57, 72, 103, 1)) ,
          centerTitle: true,
          title: Text("設備管理"),
          bottom: TabBar(tabs:myTabs,indicatorColor: Color.fromRGBO(155,164,180, 5)),
          leading:
          //返回上一頁 
          IconButton(
            icon:Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: (){},
          ),
          ),
          body: TabBarView(
            children: <Widget>[
              CarWidget(), BoxWidget()
              ],
          ),) ,),
      
              
      
    );

  }
}