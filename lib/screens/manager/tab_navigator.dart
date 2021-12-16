import 'package:ambulance_flutter/screens/dispatch/datetime_screen.dart';
import 'package:ambulance_flutter/screens/manager/manager_analysis_screen.dart';
import 'package:flutter/material.dart';
import 'manager_control_screen.dart';
import 'manager_home_screen.dart';
import 'manager_setting_screen.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "主頁")
      child = ManagerHomeScreen();
    else if (tabItem == "派車")
      child = DatetimeScreen();
    else if (tabItem == "管理")
      child = ManagerControlScreen();
    else if (tabItem == "統計")
      child = ManagerAnalysisScreen();
    else
      child = ManagerSettingScreen();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
