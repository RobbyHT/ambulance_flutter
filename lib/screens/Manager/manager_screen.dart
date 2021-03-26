import 'package:ambulance_flutter/screens/Manager/AllManagement.dart';
import 'package:ambulance_flutter/screens/Manager/page/Dispatch.dart';
import 'package:ambulance_flutter/screens/Manager/page/Reservation.dart';
import 'package:ambulance_flutter/screens/Manager/page/Setting.dart';
import 'package:ambulance_flutter/screens/Manager/page/Statising.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManagerScreen extends StatefulWidget {
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  int currentTab = 0;
  final List<Widget> screen = [
    Reservation(),
    AllManagement(),
    Statising(),
    Setting(),
    Dispatching(),
  ];
  void _onItemTap(int index) {
    setState(() => currentTab = index);
  }

  Widget currentScreen = ManagerScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //漂浮按鈕設定------------------------
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        backgroundColor: Color.fromRGBO(7, 13, 89, 1),
        onPressed: () => _onItemTap(4),
      ),
      body: Center(
        child: screen.elementAt(currentTab),
      ),
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
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () => _onItemTap(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.date_range_outlined,
                          color: currentTab == 0
                              ? Color.fromRGBO(7, 13, 89, 1)
                              : Colors.grey,
                        ),
                        Text(
                          '預約',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () => _onItemTap(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.assignment,
                          // FontAwesomeIcons.ambulance,
                          color: currentTab == 1
                              ? Color.fromRGBO(7, 13, 89, 1)
                              : Colors.grey,
                        ),
                        Text(
                          '管理',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 50,
                    onPressed: () => _onItemTap(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bar_chart,
                          color: currentTab == 2
                              ? Color.fromRGBO(7, 13, 89, 1)
                              : Colors.grey,
                        ),
                        Text(
                          '統計',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 100,
                    onPressed: () => _onItemTap(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3
                              ? Color.fromRGBO(7, 13, 89, 1)
                              : Colors.grey,
                        ),
                        Text(
                          '設定',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // body: Center(
        //   child: screen.elementAt(currentTab),
        // ),
      ),
    );
    // return Container(
    //var size = MediaQuery.of(context).size;
  }
}

// class ManagerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.home),
//         backgroundColor: Color.fromRGBO(7, 13, 89, 1),
//         onPressed: () {
//           // return ManagerScreen();
//         },
//       ),
//       //漂浮按鈕設定
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       //下方功能列設定----------------------
//       bottomNavigationBar: HomeBottomBar(),
//       //-----------------------------------
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45, //全部設備高度佔45%
//             color: Color.fromRGBO(31, 60, 136, 1),
//             // decoration: BoxDecoration(
//             // image: DecorationImage(
//             //     alignment: Alignment.centerLeft,
//             //     image: AssetImage("assets/images/cloud.png"),
//             //   ),
//             // ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: SafeArea(
//               child: Column(
//                 children: <Widget>[
//                   //右上方選項按鈕----------------------
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 52,
//                       width: 52,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(7, 13,89, 1),
//                         shape: BoxShape.circle,
//                       ),
//                       child: IconButton(
//                           icon: Icon(Icons.reorder),
//                           iconSize: 30.0,
//                           color: Colors.white,
//                           onPressed: () {}),
//                     ),
//                   ),
//                   //title-------------------------------
//                   Text("管理者介面",
//                       style: Theme.of(context)
//                           .textTheme
//                           .display1
//                           .copyWith(fontWeight: FontWeight.w900,color: Color.fromRGBO(206, 221,239, 1))),

//                   //功能框設定---------------------------
//                   Expanded(
//                     child: GridView.count(
//                       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
//                       crossAxisCount: 2,
//                       childAspectRatio: 3 / 5, //長寬比
//                       crossAxisSpacing: 20,
//                       // mainAxisSpacing: -10,
//                       children: <Widget>[
//                         CategoryCard(
//                           title:"員工管理",
//                           iconSrc: Icons.group,
//                           press: () {
//                             Navigator.push(context, MaterialPageRoute(builder:(context) {
//                               return EmpPage();
//                             }));
//                           },
//                         ),
//                         CategoryCard(
//                           title:"車輛管理",
//                           iconSrc: Icons.directions_bus_rounded,
//                           press: () {
//                             Navigator.push(context, MaterialPageRoute(builder:(context) {
//                               return CarPage();
//                             }));
//                           },
//                         ),
//                         CategoryCard(
//                           title:"庫存管理",
//                           iconSrc: Icons.medical_services,
//                           press: () {
//                             Navigator.push(context, MaterialPageRoute(builder:(context) {
//                               return StockPage();
//                             }));
//                           },
//                         ),
//                         CategoryCard(
//                           title:"公告管理",
//                           iconSrc: Icons.create,
//                           press: () {
//                             Navigator.push(context, MaterialPageRoute(builder:(context) {
//                               return AnnoPage();
//                             }));
//                           },
//                         ),
//                         ], //把做好的方框按鈕命名為此方法
//                     ),
//                   ),
//                   //--------------------------------------
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
