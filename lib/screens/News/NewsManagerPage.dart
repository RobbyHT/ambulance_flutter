import 'package:ambulance_flutter/screens/News/ManagerNewPage.dart';
import 'package:ambulance_flutter/screens/News/ManagerUpdatePage.dart';
import 'package:flutter/material.dart';

class NewsManagerPage extends StatefulWidget {
  NewsManagerPage({Key key}) : super(key: key);

  ManagerPageState createState() => ManagerPageState();
}

class ManagerPageState extends State<NewsManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: new AppBar(
        elevation: 0,
        title: Text('公告', style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.deepOrange[400],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 500,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              OutlineButton(
                color: Colors.red,
                highlightColor: Colors.red[200],
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "上一頁",
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
                ),
              ),
              OutlineButton(
                color: Colors.red,
                highlightColor: Colors.red[200],
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "新增",
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManagerNewPage()));
                },
              ),
              OutlineButton(
                color: Colors.red,
                highlightColor: Colors.red[200],
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "編輯",
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManagerUpdatePage()));
                },
              ),
              SizedBox(
                height: 15,
              ),
              OutlineButton(
                color: Colors.red,
                highlightColor: Colors.red[200],
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "下一頁",
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
