import 'package:flutter/material.dart';

class Set extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('發大財'),
      color: Color((0xFFF5CEB8)),
    );
  }
}
