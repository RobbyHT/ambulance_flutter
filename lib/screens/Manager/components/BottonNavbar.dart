import 'package:ambulance_flutter/screens/Manager/components/stock.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //Item按鈕間的距離排版
        children: <Widget>[
          BottomNavItem(
            iconSrc: Icons.date_range_outlined,
            textSrc: "Reservation",
            press: () {    
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return StockPage();
              }));
            },
          ),
          BottomNavItem(
            iconSrc: Icons.directions_bus_outlined,
            textSrc: "Dispatching",
            press: () {    
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return StockPage();
              }));
            },
            // isActive: true,
          ),
          BottomNavItem(
            iconSrc: Icons.bar_chart,
            textSrc: "Chart",
            press: () {    
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return StockPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String textSrc;
  final IconData iconSrc;
  final Function press;
  // final bool isActive;
  const BottomNavItem({
    Key key, 
    this.textSrc, 
    this.iconSrc, 
    this.press, 
    // this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: FlatButton(
        onPressed: press,
        // padding: EdgeInsets.only(left: 50,top:10,right: 30,bottom: 10),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceAround, //icon與字的排版樣式
          children: <Widget>[
            Icon(
              iconSrc,
              color:Colors.black,
            ),
            Text(
              textSrc,
              style: TextStyle(color:Colors.black),  
            ),
          ],
        ),
      ),
    );
  }
}
