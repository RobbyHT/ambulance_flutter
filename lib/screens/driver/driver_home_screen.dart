import 'dart:async';

import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/components/state_text.dart';
import 'package:ambulance_flutter/db/user_lite.dart';
import 'package:ambulance_flutter/models/dispatch.dart';
import 'package:ambulance_flutter/models/news_data.dart';
import 'package:ambulance_flutter/screens/login/login_screen.dart';
import 'package:ambulance_flutter/utils/dispatch_util.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:table_calendar/table_calendar.dart';

import 'chooseEMT_screen.dart';
import 'driver_main_screen.dart';

//主畫面
class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

bool isOpen = false;

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  List<Dispatch> _selectedEvents;
  int _counter = 0;
  Map<DateTime, List<Dispatch>> _events;
  CalendarController _calendarController;
  //AnimationController _animationController;
  Timer timer;
  int s = 0;
  List<NewsData> _newsData;
  String newsText = "最新消息---";

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _selectedEvents = [];
    _calendarController = CalendarController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTask('driver').then((val) => setState(() {
            _events = val;
          }));
      getNewsData().then((val) => setState(() {
            newsText = "";
            val.forEach((element) {
              newsText +=
                  element.created_at + '【' + element.title + '】' + '     ';
            });
          }));
      //print( ' ${_events.toString()} ');
    });

    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => loadTask());
  }

  void loadTask() {
    if (!mounted) return;

    getTask('driver').then((val) => setState(() {
          _events = val;
        }));
    checkTask().then((value) => {
          if (value.length > 0 && isOpen == false)
            {isOpen = true, _showMyDialog(value[0])}
        });
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    List<Dispatch> att = events.map((e) => e as Dispatch).toList();
    setState(() {
      _selectedEvents = att;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  Widget _buildEventsMarker(DateTime date, List<Dispatch> events) {
    if (date.year == _calendarController.focusedDay.year &&
        date.month == _calendarController.focusedDay.month &&
        date.day == _calendarController.focusedDay.day) {
      _selectedEvents = events;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.blue[400]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Color.fromARGB(255, 202, 225, 255),
        borderRadius: BorderRadius.circular(12.0),
        /*color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],*/
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.start + " -> " + event.end),
                  subtitle: Text(event.dTime),
                  trailing: event.state == 1
                      ? StateText(
                          text: "預約",
                          color: Colors.blue,
                        )
                      : event.state == 2
                          ? StateText(
                              text: "跑車中",
                              color: Colors.red,
                            )
                          : event.state == 3
                              ? StateText(
                                  text: "待填寫",
                                  color: Colors.orange,
                                )
                              : event.state == 4
                                  ? StateText(
                                      text: "完成",
                                      color: Colors.green,
                                    )
                                  : StateText(
                                      text: "取消",
                                      color: Colors.grey,
                                    ),
                  onTap: () => event.state < 3 ? _showMyDialog(event) : null,
                ),
              ))
          .toList(),
    );
  }

  Future<void> _showMyDialog(Dispatch dispatch) async {
    var btnText = "GO";
    var state = 2;
    if (dispatch.state == 2) {
      btnText = "完成";
      state = 3;
    }
    print(isOpen);
    if (isOpen) {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
                    child: Column(
                      children: [
                        Text(
                          '派車通知',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "起點：" + dispatch.start + "\n終點：" + dispatch.end,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          color: Color.fromARGB(255, 255, 127, 36),
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0)),
                          onPressed: () => {
                            isOpen = true,
                            if (dispatch.state == 1)
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChooseEMTScreen(
                                      dispatch: dispatch,
                                    ),
                                  ),
                                )
                              }
                            else
                              {
                                DispatchServices()
                                    .updDispatch(dispatch.id, state),
                                //Navigator.of(context).pop()
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DriverMainScreen(),
                                  ),
                                )
                              }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 127, 36),
                    radius: 50,
                    child: Icon(
                      Icons.assistant_photo,
                      // FontAwesomeIcons.ambulance,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '司機',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.center,
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Color.fromARGB(156, 208, 80, 36),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Icon(Icons.logout),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: () {
                    DBHelper.delete('userList');
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  }),
            ),
          ),
        ],
        toolbarHeight: 60.0,
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
      ),
      body: Stack(
        children: <Widget>[
          Marquee(
            text: newsText,
            style: TextStyle(fontWeight: FontWeight.bold),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 20.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 0,
                      width: 52,
                    ),
                  ),
                  TableCalendar(
                    locale: 'zh_CN',
                    calendarController: _calendarController,
                    events: _events,
                    initialCalendarFormat: CalendarFormat.month,
                    formatAnimation: FormatAnimation.slide,
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    builders: CalendarBuilders(
                      /*selectedDayBuilder: (context, date, _) {
                        return FadeTransition(
                          opacity: Tween(begin: 0.0, end: 1.0)
                              .animate(_animationController),
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                            color: Colors.deepOrange[300],
                            width: 100,
                            height: 100,
                            child: Text(
                              '${date.day}',
                              style: TextStyle().copyWith(fontSize: 16.0),
                            ),
                          ),
                        );
                      },*/
                      markersBuilder: (context, date, events, holidays) {
                        final children = <Widget>[];
                        if (events.isNotEmpty) {
                          children.add(
                            Positioned(
                              right: 1,
                              bottom: 1,
                              child: _buildEventsMarker(date, events),
                            ),
                          );
                        }
                        return children;
                      },
                    ),
                    onDaySelected: (day, events, holidays) {
                      _onDaySelected(day, events);
                    },
                    onVisibleDaysChanged: _onVisibleDaysChanged,
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(child: _buildEventList()),
                  /*Expanded(
                    child: ValueListenableBuilder<List<Dispatch>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                onTap: () => print('${value[index]}'),
                                title: Text('${value[index]}'),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
