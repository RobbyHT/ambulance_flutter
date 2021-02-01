import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({this.onPress, this.text, this.color});

  final Function onPress;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      margin: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
