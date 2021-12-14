import 'dart:async';

import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/db/user_lite.dart';
import 'package:ambulance_flutter/models/dispatch.dart';
import 'package:ambulance_flutter/models/news_data.dart';
import 'package:ambulance_flutter/screens/login/login_screen.dart';
import 'package:ambulance_flutter/utils/dispatch_util.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../components/state_text.dart';

class ManagerHomeScreen extends StatefulWidget {
  @override
  _ManagerHomeScreenState createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  List _selectedEvents;
  int _counter = 0;
  Map<DateTime, List<Dispatch>> _events;
  CalendarController _calendarController;
  Timer timer;
  List<NewsData> _newsData;
  String newsText = "最新消息---";

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _selectedEvents = [];
    _calendarController = CalendarController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTask('manager').then((val) => setState(() {
            _events = val;
          }));
      getNewsData().then((val) => setState(() {
            newsText = "";
            val.forEach((element) {
              newsText +=
                  element.created_at + '【' + element.title + '】' + '     ';
            });
          }));
    });

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => loadTask());
  }

  void loadTask() {
    if (!mounted) return;

    getTask('manager').then((val) => setState(() {
          _events = val;
        }));
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  Widget _buildEventsMarker(DateTime date, List events) {
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

  Widget _slidableCell(dynamic event) {
    return Slidable(
        actionPane: SlidableStrechActionPane(),
        secondaryActions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: IconSlideAction(
              caption: '刪除',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                DispatchServices().delDispatch(event.id);
                loadTask();
              },
            ),
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(
              event.start + " -> " + event.end,
              style: TextStyle().copyWith(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
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
            onTap: () => print('$event tapped!'),
          ),
        )
        /*child: ListTile(
          title: title,
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => print(title),
        ),*/
        );
  }

  Widget _buildEventList() {
    print(_selectedEvents.length);
    return ListView.builder(
      /*physics: BouncingScrollPhysics(),
      shrinkWrap: true,*/
      itemCount: _selectedEvents.length,
      itemBuilder: (BuildContext context, int index) {
        return _slidableCell(_selectedEvents[index]);
      },
      /*child: ListView(
        children: _selectedEvents
            .map((event) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
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
                    onTap: () => print('$event tapped!'),
                  ),
                ))
            .toList(),
      ),*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '管理者',
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
                color: Color.fromRGBO(7, 13, 89, 1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Icon(Icons.logout),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: () {
                    //-----------
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
        backgroundColor: Color.fromRGBO(31, 60, 136, 1),
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
