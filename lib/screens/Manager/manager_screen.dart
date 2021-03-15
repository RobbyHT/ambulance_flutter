import 'package:ambulance_flutter/screens/Manager/components/BottonNavbar.dart';
import 'package:ambulance_flutter/screens/Manager/components/announce.dart';
import 'package:ambulance_flutter/screens/Manager/components/car.dart';
import 'package:ambulance_flutter/screens/Manager/components/category_card.dart';
import 'package:ambulance_flutter/screens/Manager/components/emp.dart';
import 'package:ambulance_flutter/screens/Manager/components/stock.dart';
import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //下方功能列設定---------------------------------
      bottomNavigationBar: BottomNavbar(),
      //---------------------------------
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45, //全部設備高度佔45%
            // decoration: BoxDecoration(color: Color()),
            color: Color.fromRGBO(170, 205, 190, 0.7),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(170, 205, 190, 1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        tooltip: 'settings',
                        onPressed: null,
                      ),
                    ),
                  ),
                  Text("管理者介面",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900)),
                  //功能框設定---------------------------
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4, //長寬比
                      crossAxisSpacing: 20,
                      // mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title:"員工管理",
                          iconSrc: Icons.group,
                          press: () {    
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return EmpPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title:"車輛管理",
                          iconSrc: Icons.directions_bus_rounded,
                          press: () {    
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return CarPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title:"庫存管理",
                          iconSrc: Icons.medical_services,
                          press: () {    
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return StockPage();
                            }));
                          },
                        ),
                        CategoryCard(
                          title:"公告管理",
                          iconSrc: Icons.create,
                          press: () {    
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return AnnoPage();
                            }));
                          },
                        ),
                        ], //把做好的方框按鈕命名為此方法
                    ),
                  ),
                  //--------------------------------------
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}