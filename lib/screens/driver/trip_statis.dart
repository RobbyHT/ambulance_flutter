import 'package:flutter/material.dart';

class Statising extends StatefulWidget {
  @override
  _StatisingState createState() => _StatisingState();
}

class _StatisingState extends State<Statising> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "醫指派/個人車趟",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        toolbarHeight: 60.0,
        backgroundColor: Color.fromARGB(255, 250, 190, 150),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
