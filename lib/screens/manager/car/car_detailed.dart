import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetailedScreen extends StatefulWidget {
  @override
  _CarDetailedScreenState createState() => _CarDetailedScreenState();
}

class _CarDetailedScreenState extends State<CarDetailedScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 72, 103, 10),
      appBar: AppBar(
        elevation: 0,
        title: Text('車輛管理', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(31, 60, 136, 40),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Iphone81Widget(),
        ],
      ),
    );
  }
}

class Iphone81Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Iphone81Widget - FRAME
    return Container(
      width: 391,
      height: 667,
      decoration: BoxDecoration(
        color: Color.fromRGBO(57, 72, 103, 10),
      ),
      child: Stack(children: <Widget>[
        Positioned(
          top: 164,
          left: 20,
          child: Container(
            child: Text(''),
            width: 348, //中間區塊
            height: 275,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Color.fromRGBO(206, 221, 240, 1),
            ),
          ),
        ),
        Positioned(
          top: 239,
          left: 74,
          child: Text(
            "到期年限 : 2028\n\n"
            '清潔紀錄 : 2021/10/11\n\n'
            '維修紀錄 : 2021/09/08\n\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(68, 62, 102, 1),
                fontFamily: 'Noto Sans Javanese',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        Positioned(
          top: 138,
          left: 30,
          child: Container(
            width: 189, //堆疊小區
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              color: Color.fromRGBO(155, 164, 181, 1),
            ),
          ),
        ),
        Positioned(
          top: 115,
          left: 20,
          child: Container(
            width: 100,
            height: 100,
            child: Icon(
              FontAwesomeIcons.ambulance,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Positioned(
          top: 154, //ABC123位置置中
          left: 100,
          child: Text(
            '7768-AU',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Noto Sans Javanese',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
      ]),
    );
  }
}
