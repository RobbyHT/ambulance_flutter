import 'package:ambulance_flutter/screens/manager/car_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'car_manage.dart';

class CarDetailedScreen extends StatelessWidget {
  final Cardata car;
  final myController = TextEditingController();
  CarDetailedScreen(this.car);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(64, 76, 107, 50),
        appBar: AppBar(
          elevation: 0,
          title: Text('車輛管理', style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(36, 62, 131, 50),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarManageScreen()));
            },
          ),
        ),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          height: 180, //中間區塊
          width: 300,
          decoration: BoxDecoration(
            color: Color.fromARGB(210, 206, 221, 240),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                //白色小長方形
                bottom: 158,
                left: 10,
                child: Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Positioned(
                //車子ICON
                bottom: 168,
                left: 30,
                child: Icon(
                  FontAwesomeIcons.ambulance,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                //車牌
                bottom: 168,
                left: 80,
                child: Text(
                  car.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white, //字體顏色
                  ),
                ),
              ),
              Positioned(
                bottom: 110,
                left: 50,
                child: Text(
                  '到期年限：',
                  style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 113,
                left: 145,
                child: Text(
                  car.maturity,
                  style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      //decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 50,
                child: Text(
                  '清潔紀錄：',
                  style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 83,
                left: 145,
                child: Text(
                  car.cleaners,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      // decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 50,
                child: Text(
                  '維修紀錄：',
                  style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 53,
                left: 145,
                child: Text(
                  car.maintain,
                  style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      //decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
            ],
          ),
        )));
  }
}
