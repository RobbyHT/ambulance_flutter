import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'car_data.dart';
import 'car_detailed.dart';

class CarManageScreen extends StatefulWidget {
  @override
  _CarManageScreenState createState() => _CarManageScreenState();
}

class _CarManageScreenState extends State<CarManageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 35.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: CAR_DATA.length,
              itemBuilder: (context, index) {
                Cardata car = CAR_DATA[index];
                return Container(
                  height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 50, right: 50, top: 25),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(240, 155, 164, 181),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ListTile(
                    title: Text(
                      car.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    minLeadingWidth: 70, //將文字置中
                    subtitle: Text(
                      '到期年限：' + car.maturity,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        height: 2.0,
                      ),
                    ),

                    contentPadding: EdgeInsets.only(left: 33.0), //icon距離左方33.0
                    leading: Icon(
                      FontAwesomeIcons.ambulance,
                      size: 35,
                      color: Colors.white,
                    ),

                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarDetailedScreen(car)));
                    },
                  ),
                );
              })),
    );
  }
}
