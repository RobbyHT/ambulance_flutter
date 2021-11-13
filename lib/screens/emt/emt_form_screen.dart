import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

import 'emt_home_screen.dart';
import 'emt_main_screen.dart';

class EmtFormScreen extends StatefulWidget {
  EmtFormScreen({Key key, this.dispatch}) : super(key: key);

  Dispatch dispatch;

  @override
  _EmtFormScreenState createState() => _EmtFormScreenState();
}

class _EmtFormScreenState extends State<EmtFormScreen> {
  List<String> buttonList = [
    "是",
    "否",
  ];

  TextEditingController controllerWeight = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerOther = new TextEditingController();
  var arr = new List(5);
  //var arr = [0, 0, 0, 0, 0];
  int cannula = 0, adultMask = 0, childMask = 0, noMask = 0, ambu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('耗材填寫'),
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 50.0)),
                Text(
                  "氧氣鼻管",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      arr[0] = index == 0 ? 4 : null;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    selectedColor: Color.fromARGB(180, 255, 127, 36),
                    buttonColor: Colors.white,
                    //buttonColor: Colors.white,
                    //selectedColor: Color.fromRGBO(31, 60, 136, 1),
                    buttonWidth: 120,
                  ),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "成人型氧氣面罩",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      arr[1] = index == 0 ? 5 : null;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    selectedColor: Color.fromARGB(180, 255, 127, 36),
                    buttonColor: Colors.white,
                    //buttonColor: Colors.white,
                    //selectedColor: Color.fromRGBO(31, 60, 136, 1),
                    buttonWidth: 120,
                  ),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "兒童用氧氣面罩",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      arr[2] = index == 0 ? 6 : null;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    selectedColor: Color.fromARGB(180, 255, 127, 36),
                    buttonColor: Colors.white,
                    //buttonColor: Colors.white,
                    //selectedColor: Color.fromRGBO(31, 60, 136, 1),
                    buttonWidth: 120,
                  ),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "非再吸入型氧氣面罩",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      arr[3] = index == 0 ? 7 : null;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    selectedColor: Color.fromARGB(180, 255, 127, 36),
                    buttonColor: Colors.white,
                    //buttonColor: Colors.white,
                    //selectedColor: Color.fromRGBO(31, 60, 136, 1),
                    buttonWidth: 120,
                  ),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "甦醒球",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      arr[4] = index == 0 ? 39 : null;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    selectedColor: Color.fromARGB(180, 255, 127, 36),
                    buttonColor: Colors.white,
                    //buttonColor: Colors.white,
                    //selectedColor: Color.fromRGBO(31, 60, 136, 1),
                    buttonWidth: 120,
                  ),
                ),
              ],
            ),
            Row(),
            new Padding(padding: new EdgeInsets.only(top: 50.0)),
            Btn(
              text: '提交',
              color: Color.fromARGB(180, 255, 127, 36),
              //color: Color.fromRGBO(31, 60, 136, 1),
              onPress: () => _onSubmit(),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    DispatchServices().updDispatch(widget.dispatch.id, 4);
    DispatchServices().insConsumablesRecord(widget.dispatch.id, arr);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => EmtMainScreen(),
        ),
        (route) => false);
    return;
  }
}
