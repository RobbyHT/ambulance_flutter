import 'package:flutter/material.dart';
import 'components/search_bar.dart';

class Set extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "醫指派/派單",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        toolbarHeight: 60.0,
        backgroundColor: Color.fromARGB(255, 250, 190, 150),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
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
                        color: Color.fromARGB(255, 250, 190, 150),
                      ),
                    ),
                    child: Text("接單"),
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
