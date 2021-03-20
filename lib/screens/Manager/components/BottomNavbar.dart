// import 'package:ambulance_flutter/main.dart';
import 'package:ambulance_flutter/screens/Manager/manager_screen.dart';
import 'package:ambulance_flutter/screens/Manager/page2/Dispatch.dart';
import 'package:ambulance_flutter/screens/Manager/page2/Reservation.dart';
import 'package:ambulance_flutter/screens/Manager/page2/Statising.dart';
import 'package:ambulance_flutter/screens/Manager/page2/setting.dart';
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
    Reservation(),
    Dispatching(),
  ];

//活動頁(tab)

  Widget currentScreen = ManagerScreen();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //圖形置中
        children: <Widget>[
          //左半icon設定------------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 100, //左方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Reservation(); //被點下跳轉至預約
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.date_range_outlined,
                      color: currentTab == 1 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                    ),
                    Text(
                      '預約',
                      style: TextStyle(
                        color: currentTab == 1 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                      ),
                    ),
                    
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 50, //左方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Dispatching(); //被點下跳轉至派車
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.directions_bus_outlined,
                      color: currentTab == 2 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                    ),
                    Text(
                      '派車',
                      style: TextStyle(
                        color: currentTab == 2 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          //右半icon設定------------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 50, //右方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Statising(); //被點下跳轉至統計
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.bar_chart,
                      color: currentTab == 3 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                    ),
                    Text(
                      '統計',
                      style: TextStyle(
                        color: currentTab == 3 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                      ),
                    ),
                    
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 100, //右方按鈕位置置中
                onPressed: () {
                  setState(() {
                    currentScreen = Setting(); //被點下跳轉至設定
                    currentTab = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      color: currentTab == 4 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
                    ),
                    Text(
                      '設定',
                      style: TextStyle(
                        color: currentTab == 4 ? Color.fromRGBO(7, 13, 89, 1) : Colors.grey,
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
// class BottomNavbar extends StatelessWidget {
//   const BottomNavbar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container( 
//       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//       height: 70,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween, //Item按鈕間的距離排版
//         children: <Widget>[
//           BottomNavItem(
//             iconSrc: Icons.date_range_outlined,
//             textSrc: "Reservation",
//             press: () {    
//               Navigator.push(context, MaterialPageRoute(builder:(context) {
//                 return StockPage();
//               }));
//             },
//           ),
//           BottomNavItem(
//             iconSrc: Icons.directions_bus_outlined,
//             textSrc: "Dispatching",
//             press: () {    
//               Navigator.push(context, MaterialPageRoute(builder:(context) {
//                 return StockPage();
//               }));
//             },
//             // isActive: true,
//           ),
//           BottomNavItem(
//             iconSrc: Icons.bar_chart,
//             textSrc: "Chart",
//             press: () {    
//               Navigator.push(context, MaterialPageRoute(builder:(context) {
//                 return StockPage();
//               }));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BottomNavItem extends StatelessWidget {
//   final String textSrc;
//   final IconData iconSrc;
//   final Function press;
//   // final bool isActive;
//   const BottomNavItem({
//     Key key, 
//     this.textSrc, 
//     this.iconSrc, 
//     this.press, 
//     // this.isActive = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: FlatButton(
//         onPressed: press,
//         // padding: EdgeInsets.only(left: 50,top:10,right: 30,bottom: 10),
//         child: Column( 
//           mainAxisAlignment: MainAxisAlignment.spaceAround, //icon與字的排版樣式
//           children: <Widget>[
//             Icon(
//               iconSrc,
//               color:Colors.black,
//             ),
//             Text(
//               textSrc,
//               style: TextStyle(color:Colors.black),  
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
