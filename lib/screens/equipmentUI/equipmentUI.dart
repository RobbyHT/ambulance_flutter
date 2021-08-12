import 'package:ambulance_flutter/screens/equipmentUI/components/choice.dart';
import 'package:flutter/material.dart';

class equipmentUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: (Color.fromRGBO(57,72,103,100)) ,
          centerTitle: true,
          title: Text("設備管理"),
          leading:
          //返回上一頁 
          IconButton(
            icon:Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: (){},
          ),
          //搜尋
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search_rounded , color: Colors.white),
          //     onPressed: () {},
          //     )
          //     ]
           ),      
      body: Iphone11promainWidget(),
    );
  }
}