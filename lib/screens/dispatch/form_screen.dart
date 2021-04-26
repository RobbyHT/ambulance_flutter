import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

import 'chooseDriver_screen.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key key, this.dispatch}) : super(key: key);

  Dispatch dispatch;

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  List<String> buttonList = [
    "是",
    "否",
  ];

  TextEditingController controllerWeight = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerOther = new TextEditingController();
  int o2, elevator, special;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('補充資訊'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "氧氣：",
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
                      o2 = index;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    buttonColor: Colors.white,
                    selectedColor: Colors.cyan,
                    //buttonWidth: 150,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "電梯：",
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
                      elevator = index;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    buttonColor: Colors.white,
                    selectedColor: Colors.cyan,
                    //buttonWidth: 150,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "特護：",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  //width: MediaQuery.of(context).size.width,
                  //height: 160,
                  child: CustomRadioButton(
                    buttonLables: buttonList,
                    buttonValues: buttonList,
                    radioButtonValue: (value, index) {
                      special = index;
                      print("Button value " + value.toString());
                      print("Integer value " + index.toString());
                    },
                    horizontal: true,
                    enableShape: true,
                    buttonSpace: 5,
                    initialSelection: 1,
                    buttonColor: Colors.white,
                    selectedColor: Colors.cyan,
                    //buttonWidth: 150,
                  ),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Container(
              width: 350.0,
              child: TextField(
                controller: controllerWeight,
                decoration: new InputDecoration(
                  hintText: "KG",
                  labelText: "患者體重",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Container(
              width: 350.0,
              child: TextField(
                controller: controllerPhone,
                decoration: new InputDecoration(
                  hintText: "電話",
                  labelText: "電話",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Container(
              width: 350.0,
              child: TextField(
                controller: controllerOther,
                scrollPadding: new EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                maxLines: 5,
                decoration: new InputDecoration(
                  hintText: "備註",
                  labelText: "備註",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            Btn(
              text: '下一步',
              color: Colors.blue[500],
              onPress: () => _onSubmit(),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    widget.dispatch.o2 = o2;
    widget.dispatch.elevator = elevator;
    widget.dispatch.special = special;
    widget.dispatch.weight = controllerWeight.text;
    widget.dispatch.phone = controllerPhone.text;
    widget.dispatch.remark = controllerOther.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseDriveScreen(
          dispatch: widget.dispatch,
        ),
      ),
    );

    // print("日期：" + widget.dispatch.d_date);
    // print("時間：" + widget.dispatch.d_time);
    // print("起點：" + widget.dispatch.start);
    // print("終點：" + widget.dispatch.end);

    // print("氧氣：" + widget.dispatch.o2.toString());
    // print("電梯：" + widget.dispatch.elevator.toString());
    // print("特護：" + widget.dispatch.special.toString());

    // print("體重：" + widget.dispatch.weight.toString());
    // print("電話：" + widget.dispatch.phone);
    // print("備註：" + widget.dispatch.remark);

    return;
  }
}
