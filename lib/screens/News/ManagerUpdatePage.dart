import 'package:ambulance_flutter/screens/News/NewsManagerPage.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/icon_button.dart';

class ManagerUpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: managerUpdatePage(),
    );
  }
}

class managerUpdatePage extends StatefulWidget {
  @override
  _managerUpdatePageState createState() => _managerUpdatePageState();
}

class _managerUpdatePageState extends State<managerUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        elevation: 0,
        title: Text(
          '新公告',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewsManagerPage()));
          },
        ),
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "主旨：",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange[400],
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  color: Colors.grey.withOpacity(0.2),
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Title...",
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "內容：",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange[400],
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 330,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: TextField(
                    maxLines: 15,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add content",
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          OutlineButton.icon(
            icon: Icon(
              Icons.send,
              color: Colors.deepOrange[400],
            ),
            disabledBorderColor: Colors.black26,
            disabledTextColor: Colors.black26,
            label: Text(
              "更新公告",
              style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
            ),
          ),
          /*Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.only(left: 40, right: 40),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.deepOrange[400]),
            child: Center(
              child: Text(
                '更新公告',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),*/
        ],
      )),
    );
  }
}
