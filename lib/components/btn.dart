import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({this.onPress, this.text, this.color});

  final Function onPress;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
    );
  }
}
