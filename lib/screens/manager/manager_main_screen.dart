import 'package:flutter/material.dart';
import 'tab_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManagerMainScreen extends StatefulWidget {
  ManagerMainScreen({Key key, this.page}) : super(key: key);
  final int page;

  @override
  _ManagerMainScreenState createState() => _ManagerMainScreenState();
}

class _ManagerMainScreenState extends State<ManagerMainScreen> {
  String _currentPage = "主頁";
  List<String> pageKeys = ["主頁", "派車", "管理", "統計", "設定"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "主頁": GlobalKey<NavigatorState>(),
    "派車": GlobalKey<NavigatorState>(),
    "管理": GlobalKey<NavigatorState>(),
    "統計": GlobalKey<NavigatorState>(),
    "設定": GlobalKey<NavigatorState>(),
  };

  int currentTab = 0;
  void _onItemTap(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        currentTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "主頁") {
            _onItemTap("主頁", 0);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        //漂浮按鈕設定------------------------
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Color.fromRGBO(7, 13, 89, 1),
          onPressed: () => _onItemTap(pageKeys[0], 0),
        ),
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("主頁"),
          _buildOffstageNavigator("派車"),
          _buildOffstageNavigator("管理"),
          _buildOffstageNavigator("統計"),
          _buildOffstageNavigator("設定"),
        ]),
        primary: true,
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
                      onPressed: () => _onItemTap(pageKeys[1], 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.ambulance,
                            color: currentTab == 1
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                          Text(
                            '派車',
                            style: TextStyle(
                              color: currentTab == 1
                                  ? Color.fromRGBO(7, 13, 89, 1)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () => _onItemTap(pageKeys[2], 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.date_range_outlined,
                            color: currentTab == 2
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                          Text(
                            '管理',
                            style: TextStyle(
                              color: currentTab == 2
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
                      onPressed: () => _onItemTap(pageKeys[3], 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.bar_chart,
                            color: currentTab == 3
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                          Text(
                            '統計',
                            style: TextStyle(
                              color: currentTab == 3
                                  ? Color.fromRGBO(7, 13, 89, 1)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 100,
                      onPressed: () => _onItemTap(pageKeys[4], 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: currentTab == 4
                                ? Color.fromRGBO(7, 13, 89, 1)
                                : Colors.grey,
                          ),
                          Text(
                            '設定',
                            style: TextStyle(
                              color: currentTab == 4
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
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
