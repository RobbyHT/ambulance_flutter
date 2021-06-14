import 'package:flutter/material.dart';

import 'emt_home_screen.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "主頁")
      child = EmtHomeScreen();
    else if (tabItem == "統計")
      child = EmtHomeScreen();
    else if (tabItem == "設定")
      child = EmtHomeScreen();
    else
      child = EmtHomeScreen();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
