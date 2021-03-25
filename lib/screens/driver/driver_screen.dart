import 'package:ambulance_flutter/screens/driver/components/search_bar.dart';
import 'package:flutter/material.dart';

//主畫面
class DriverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('醫指派/司機'),
        toolbarHeight: 80.0,
        backgroundColor: Color.fromARGB(255, 139, 126, 102),
      ),
      body: Stack(
        children: <Widget>[
          /*Container(
            //// 背景顏色高度

            height: size.height * .40,
            decoration: BoxDecoration(
              color: Color(
                (0xFFF5CEB8),
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/cloud.png"),
              ),
            ),
          ),*/
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 0,
                      width: 52,
                    ),
                  ),
                  /*Text(
                    "醫指派/司機",
                    style: Theme.of(
                      context,
                    ).textTheme.display1.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.black87),
                  ),*/
                  SearchBar(),
                  Container(
                    // margin: EdgeInsets.only(left: 40, top: 40),
                    //设置 child 居中
                    alignment: Alignment(0, 0),
                    height: 180,
                    width: 450,
                    //边框设置
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.white,
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      //设置四周边框
                      border: new Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 139, 126, 102),
                      ),
                    ),
                    child: Text("公告"),
                    margin: EdgeInsets.only(bottom: 40),
                  ),
                  /*Container(
                      child: Text(
                        '公告',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 250, 235, 215),
                        boxShadow: [
                          //BoxShadow(color: Colors.green, spreadRadius: 3),
                        ],
                      ),
                      height: 180,
                      width: 450,
                      margin: EdgeInsets.only(bottom: 50)),
                  Container(
                      child: Text(
                        '接單',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 250, 235, 215),
                        boxShadow: [
                          //BoxShadow(color: Colors.green, spreadRadius: 3),
                        ],
                      ),
                      height: 180,
                      width: 450,
                      margin: EdgeInsets.only(bottom: 0)),*/
                  Container(
                    // margin: EdgeInsets.only(left: 40, top: 40),
                    //设置 child 居中
                    alignment: Alignment(0, 0),
                    height: 180,
                    width: 450,
                    //边框设置
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.white,
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      //设置四周边框
                      border: new Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 139, 126, 102),
                      ),
                    ),
                    child: Text("接單"),
                  ),
                  /* Container(
                    alignment: Alignment.center,
                    color: Colors.amber[100],
                    child: Text('公告'),
                    constraints: BoxConstraints(
                        maxWidth: 450,
                        maxHeight: 150,
                        minWidth: 50,
                        minHeight: 50),
                    margin: EdgeInsets.only(bottom: 40),
                  ),*/
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        /*FlatButton(
                          color: Colors.blueAccent,
                          child: Text("1"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),*/
                        /* IconButton(
                            icon: Icon(Icons.directions_bus),
                            iconSize: 40.0,
                            color: Colors.red,
                            onPressed: () {}),
                        */
                        /*CategoryCard(
                          title: "個人車趟",
                          iconSrc: Icons.ac_unit_sharp,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                //return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "公告管理",
                          iconSrc: Icons.ac_unit_sharp,
                          press: () {},
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
