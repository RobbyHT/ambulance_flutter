import 'package:flutter/material.dart';
import 'tab_navigator.dart';

class DriverMainScreen extends StatefulWidget {
  DriverMainScreen({Key key, this.page}) : super(key: key);
  final int page;

  @override
  _DriverMainScreenState createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  String _currentPage = "主頁";
  List<String> pageKeys = ["主頁", "統計", "設定"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "主頁": GlobalKey<NavigatorState>(),
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
          backgroundColor: Color.fromARGB(180, 255, 127, 36),
          onPressed: () => _onItemTap(pageKeys[0], 0),
        ),
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("主頁"),
          _buildOffstageNavigator("統計"),
          _buildOffstageNavigator("設定"),
        ]),
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
                      minWidth: 180,
                      onPressed: () => _onItemTap(pageKeys[1], 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.bar_chart,
                            color: currentTab == 1
                                ? Color.fromARGB(250, 255, 130, 71)
                                : Colors.grey,
                          ),
                          Text(
                            '統計',
                            style: TextStyle(
                              color: currentTab == 1
                                  ? Color.fromARGB(250, 255, 130, 71)
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Right Tab bar icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 180,
                      onPressed: () => _onItemTap(pageKeys[2], 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: currentTab == 2
                                ? Color.fromARGB(250, 255, 130, 71)
                                : Colors.grey,
                          ),
                          Text(
                            '設定',
                            style: TextStyle(
                              color: currentTab == 2
                                  ? Color.fromARGB(250, 255, 130, 71)
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
