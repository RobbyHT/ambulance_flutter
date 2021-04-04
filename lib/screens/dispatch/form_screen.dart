import 'package:ambulance_flutter/components/btn.dart';
import 'package:flutter/material.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key key, this.d_date, this.d_time, this.start, this.end})
      : super(key: key);

  String d_date;
  String d_time;
  String start;
  String end;

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
  int A, B, C;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      A = index;
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
                      B = index;
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
                      C = index;
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
    print("氧氣：" + A.toString());
    print("電梯：" + B.toString());
    print("特護：" + C.toString());

    print("體重：" + controllerWeight.text);
    print("電話：" + controllerPhone.text);
    print("備註：" + controllerOther.text);

    print(widget.d_date);
    print(widget.d_time);
    print(widget.start);
    print(widget.end);
    return;
  }
}
