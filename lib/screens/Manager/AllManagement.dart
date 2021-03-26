import 'package:ambulance_flutter/screens/Manager/components/category_card.dart';
import 'package:ambulance_flutter/screens/Manager/page/announce.dart';
import 'package:ambulance_flutter/screens/Manager/page/car.dart';
import 'package:ambulance_flutter/screens/Manager/page/emp.dart';
import 'package:ambulance_flutter/screens/Manager/page/stock.dart';
import 'package:flutter/material.dart';

class AllManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: size.height * .45, //全部設備高度佔45%
          color: Color.fromRGBO(31, 60, 136, 1),
          // decoration: BoxDecoration(
          // image: DecorationImage(
          //     alignment: Alignment.centerLeft,
          //     image: AssetImage("assets/images/cloud.png"),
          //   ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                //右上方選項按鈕----------------------
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(7, 13, 89, 1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        icon: Icon(Icons.reorder),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () {}
                    ),
                  ),
                ),
                //title-------------------------------
                Text("其他管理",
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(206, 221, 239, 1))),

                //功能框設定---------------------------
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 5, //長寬比
                    crossAxisSpacing: 20,
                    // mainAxisSpacing: -10,
                    children: <Widget>[
                      CategoryCard(
                        title: "員工管理",
                        iconSrc: Icons.group,
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmpPage();
                          }));
                        },
                      ),
                      CategoryCard(
                        title: "車輛管理",
                        iconSrc: Icons.directions_bus_rounded,
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CarPage();
                          }));
                        },
                      ),
                      CategoryCard(
                        title: "庫存管理",
                        iconSrc: Icons.medical_services,
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return StockPage();
                          }));
                        },
                      ),
                      CategoryCard(
                        title: "公告管理",
                        iconSrc: Icons.create,
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
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
    );
  }
}
