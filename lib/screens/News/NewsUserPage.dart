import 'package:flutter/material.dart';

class NewsUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text('公告', style: TextStyle(fontSize: 25)),
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,框框置中
        children: <Widget>[
          //card(),
          Container(
              height: 500,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(200, 251, 198, 135),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
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
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                color: Colors.red,
                highlightColor: Colors.red[200],
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "00/00", //頁數要變成自動調整
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange[400]),
                ),
              ),
              /*SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0),
                decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(10.5)),
                child: Text('00/00'), //頁數要變成自動挑整
              ),*/
              SizedBox(
                height: 20,
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
