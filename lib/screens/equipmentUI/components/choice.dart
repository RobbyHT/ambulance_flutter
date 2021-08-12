import 'package:ambulance_flutter/screens/equipmentUI/components/car_equipment.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;import 'dart:math' as math;

class Iphone11promainWidget extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
          // Figma Flutter Generator Iphone11promainWidget - FRAME
            return Container(
  //             width: 375,
  //     height: 820,
  //     decoration: BoxDecoration(
  //         color : Color.fromRGBO(255, 255, 255, 1),
  // ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 400,
        height: 820,
        decoration: BoxDecoration(
          color : Color.fromRGBO(20, 39, 78, 1),
  )
      )
      ),
      Positioned(
        top: 200,
        left: 50,
        child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
      border : Border.all(
          color: Color.fromRGBO(155, 164, 180, 1),
          width: 3,
        ),
  )
      )
      ),
      Positioned(
        top: 215,
        left: 160,
        child: Text('車內設備', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 20,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      
      ),
      Positioned(
        top: 350,
        left: 50,
        child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
      border : Border.all(
          color: Color.fromRGBO(155, 164, 180, 1),
          width: 3,
        ),
  )
      )
      ),
      Positioned(
        top: 365,
        left: 160,
        child: Text('急救箱配備		', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontSize: 20,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
      //車內設備
      Positioned(
        top: 200,
        left: 303,
        child: Transform.rotate(
        angle: 179.99999499104388 * (math.pi / 180),
        child: IconButton(
            icon:Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Iphone11procarWidget();
                    },
                  ),
                );
            },
          ),
      )
      ),
      //急救箱裝備
      Positioned(
        top: 350,
        left: 303,
        child: Transform.rotate(
        angle: 179.99999499104388 * (math.pi / 180),
        child: IconButton(
            icon:Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            onPressed: (){},
          ),
      )
      ),
      Positioned(
        top: 200,
        left: 100,
        child: IconButton(icon:Icon(Icons.circle , color: Colors.white),
            onPressed: (){},)
            ),
      Positioned(
        top: 350,
        left: 100,
        child: IconButton(icon:Icon(Icons.circle , color: Colors.white),
            onPressed: (){},)
            )
        ]
      )
    );
          }
        }