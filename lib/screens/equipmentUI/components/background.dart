import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      
      // decoration: new BoxDecoration(color: Colors.red[100]),
      // height: size.height,
      // width: double.infinity,
      child: Scaffold(
      
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
          
        ),
      
      
    );
  }
}