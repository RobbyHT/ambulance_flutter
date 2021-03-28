import 'package:ambulance_flutter/main.dart';
import 'package:ambulance_flutter/screens/driver/driver_screen.dart';
import 'package:ambulance_flutter/screens/driver/settings.dart';
import 'package:ambulance_flutter/screens/driver/trip_statis.dart';
import 'package:flutter/material.dart';

//物件屬性(可變動)
class HomeBottomBar1 extends StatefulWidget {
  @override
  _HomeBottomBar1State createState() => _HomeBottomBar1State();
}

class _HomeBottomBar1State extends State<HomeBottomBar1> {
  int currentTab = 0; // 回傳參數是一個畫面
  //類似陣列的概念
  final List<Widget> screens = [
    DriverScreen(), //0
    Statising(), //1
    Dispatch(), //2
  ];

  void _onItemTap(int index) {
    //index要傳的值,觸發版面去變動
    setState(() => currentTab = index);
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Statising();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentTab), //根據elementAt接收list的值決定去哪個畫面
      //漂浮按鈕屬性
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: Color.fromARGB(255, 250, 190, 150),
        onPressed: () => _onItemTap(0), //主頁面跳到0的畫面
      ),
      //按鈕置中
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //底下按鈕頁面
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //個人車趟按鈕
                  MaterialButton(
                    minWidth: 180,
                    onPressed: () => _onItemTap(1), //按鈕跳到車趟的畫面
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.insert_chart_outlined,
                          color: currentTab == 1
                              ? Color.fromARGB(250, 255, 130, 71)
                              : Colors.grey,
                        ),
                        Text(
                          '個人車趟',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color.fromARGB(250, 255, 130, 71)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //設定按鈕
                  MaterialButton(
                    minWidth: 180,
                    onPressed: () => _onItemTap(2), //按鈕跳到設定的畫面
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.wysiwyg,
                          color: currentTab == 2
                              ? Color.fromARGB(250, 255, 130, 71)
                              : Colors.grey,
                        ),
                        Text(
                          '派單',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color.fromARGB(250, 255, 130, 71)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
