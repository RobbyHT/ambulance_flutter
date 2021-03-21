import 'package:ambulance_flutter/screens/driver/settings.dart';
import 'package:ambulance_flutter/screens/driver/trip_statis.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  HomeBottomBarState createState() => HomeBottomBarState();
}

class HomeBottomBarState extends State<HomeBottomBar> {
  int currentTab = 0;
  final List<Widget> screen = [
    Setting(),
    Statising(),
  ];

//活動頁(tab)
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Statising();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //圖形置中
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 160, //左方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Statising(); //被點下跳轉至車輛統計
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.signal_cellular_alt,
                      color: currentTab == 0 ? Colors.redAccent : Colors.grey,
                    ),
                    Text(
                      '車輛統計',
                      style: TextStyle(
                        color: currentTab == 0 ? Colors.redAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Right Tab bar icons

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 160, //右方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Setting(); //被點下跳轉至設定
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: currentTab == 2 ? Colors.redAccent : Colors.grey,
                    ),
                    Text(
                      '設定',
                      style: TextStyle(
                        color: currentTab == 2 ? Colors.redAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
