import 'package:flutter/material.dart';

class DropDown1 extends StatefulWidget {
  @override
  _DropDown1State createState() => _DropDown1State();
}

class _DropDown1State extends State<DropDown1> {
  String dropdownValue1;
  List _liences = ['EMT-1', 'EMT-2', '其他'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: 300.0,
          height: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.grey[200],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.0),
                child: DropdownButton(
                  hint: Text("選擇證照"),
                  icon: Icon(Icons.arrow_drop_down),
                  value: dropdownValue1,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue1 = newValue;
                    });
                  },
                  items: _liences.map((newValue) {
                    return DropdownMenuItem(
                        value: newValue, child: Text(newValue));
                  }).toList(),
                ),
              ),
            ],
          )),
    );
  }
}
