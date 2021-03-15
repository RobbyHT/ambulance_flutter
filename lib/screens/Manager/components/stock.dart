import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //定义列表widget的list
    List<Widget> list=<Widget>[];

    //Demo数据定义
    var data=[
      {"id":1,"title":"测试数据AAA","subtitle":"ASDFASDFASDF"},
      {"id":2,"title":"测试数据bbb","subtitle":"ASDFASDFASDF"},
      {"id":3,"title":"测试数据ccc","subtitle":"ASDFASDFASDF"},
      {"id":4,"title":"测试数据eee","subtitle":"ASDFASDFASDF"},
    ];

    //根据Demo数据，构造列表ListTile组件list
    for (var item in data) {
      print(item["title"]);

      list.add( ListTile( 
          title: Text(item["title"],style: TextStyle(fontSize: 18.0) ),
          subtitle: Text(item["subtitle"]),
          leading:  Icon( Icons.fastfood, color:Colors.orange ),
          trailing: Icon(Icons.keyboard_arrow_right)
      ));
    }

    //返回整个页面
    return Scaffold(
      appBar: AppBar(
        title: Text("庫存管理"),
      ),
      body: Center(
        child: ListView(
          children: list,
        )
      ),
    );
  }
}