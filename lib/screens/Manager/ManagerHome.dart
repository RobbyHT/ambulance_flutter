// import 'package:ambulance_flutter/screens/Manager/components/category_card.dart';
// import 'package:ambulance_flutter/screens/Manager/page/announce.dart';
// import 'package:ambulance_flutter/screens/Manager/page/car.dart';
// import 'package:ambulance_flutter/screens/Manager/page/emp.dart';
// import 'package:ambulance_flutter/screens/Manager/page/stock.dart';
// import 'package:ambulance_flutter/screens/Manager/page2/Dispatch.dart';
// import 'package:ambulance_flutter/screens/Manager/page2/Reservation.dart';
// import 'package:ambulance_flutter/screens/Manager/page2/Setting.dart';
// import 'package:ambulance_flutter/screens/Manager/page2/Statising.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManagerHomeScreen extends StatefulWidget {
  @override
  _ManagerHomeScreenState createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Icon(
      FontAwesomeIcons.ambulance,
      size: 100.0,
    ),
    Icon(
      Icons.people,
      size: 200.0,
    ),
    Icon(
      Icons.home,
      size: 200.0,
    ),
    Icon(
      Icons.bar_chart,
      size: 200.0,
    ),
    Icon(
      Icons.settings,
      size: 200.0,
    ),
  ];
  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          leading: Icon(FontAwesomeIcons.cat),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.ambulance,
                  color: Colors.black,
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.black,
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: 'Home',
            ),
          ],
          onTap: _onItemTap,
          currentIndex: _selectedIndex,
        ),
        body: Center(
          child: _widgetOption.elementAt(_selectedIndex),
        ));
  }
}