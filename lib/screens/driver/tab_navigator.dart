import 'package:flutter/material.dart';
import 'driver_home_screen.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "主頁")
      child = DriverHomeScreen();
    else if (tabItem == "統計")
      child = DriverHomeScreen();
    else if (tabItem == "設定")
      child = DriverHomeScreen();
    else
      child = DriverHomeScreen();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
