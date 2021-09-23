import 'package:flutter/material.dart';

class CarDetailedScreen extends StatefulWidget {
  @override
  _CarDetailedScreenState createState() => _CarDetailedScreenState();
}

class _CarDetailedScreenState extends State<CarDetailedScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: ListView(
          children: [
            Iphone81Widget(),
          ],
        ),
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
          color: Color.fromRGBO(20, 39, 79, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 164,
              left: 32,
              child: Container(
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
                  ))),
          Positioned(
              top: 138,
              left: 48,
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
                  ))),
          Positioned(
              top: 149,
              left: 65,
              child: Container(
                  width: 53,
                  height: 31,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/car.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 154, //ABC123位置置中
              left: 125,
              child: Text(
                'ABC123',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Noto Sans Javanese',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 450, //上方車輛長條
                  height: 51,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(57, 72, 103, 1),
                  ))),
          Positioned(
              top: 18,
              left: 159,
              child: Text(
                '車輛管理',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto Slab',
                    fontSize: 20,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 3,
              left: 370,
              child: Container(
                  child: Stack(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ]))),
        ]));
  }
}
