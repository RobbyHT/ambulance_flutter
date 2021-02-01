import 'package:flutter/material.dart';

class LinkBtn extends StatelessWidget {
  LinkBtn({this.onPress, this.text, this.color});

  final Function onPress;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
