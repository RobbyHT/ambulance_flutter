import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/txt.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                title: Txt(text: 'car')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Txt(text: 'people')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Txt(text: 'home')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.black,
                ),
                title: Txt(text: 'bar_chart')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Txt(text: 'settings')),
          ],
          onTap: _onItemTap,
          currentIndex: _selectedIndex,
        ),
        body: Center(
          child: _widgetOption.elementAt(_selectedIndex),
        ));
  }
}
