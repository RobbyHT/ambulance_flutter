import 'package:ambulance_flutter/models/dispatch.dart';
import 'package:ambulance_flutter/utils/dispatch_util.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//主畫面
class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  List _selectedEvents;
  int _counter = 0;
  Map<DateTime, List<Dispatch>> _events;
  CalendarController _calendarController;
  //AnimationController _animationController;

  @override
  void initState() {
    final _selectedDay = DateTime.now();
    _selectedEvents = [];
    _calendarController = CalendarController();
    /*_animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();*/

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getTask().then((val) => setState(() {
            _events = val;
          }));
      //print( ' ${_events.toString()} ');
    });
    super.initState();
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
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '司機',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        toolbarHeight: 60.0,
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
      ),
      body: Stack(
        children: <Widget>[
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
