import 'package:ambulance_flutter/models/customer.dart';
import 'package:ambulance_flutter/screens/clientdata/ClientData.dart';
import 'package:ambulance_flutter/screens/clientdata/client_data.dart';
import 'package:flutter/material.dart';

class ClientOnlyScreen extends StatelessWidget {
  final Customer customer;
  final myController = TextEditingController();

  ClientOnlyScreen(this.customer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(57, 72, 103, 10),
        appBar: AppBar(
          elevation: 0,
          title: Text('客戶管理', style: TextStyle(fontSize: 20)),
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ClientData()));
            },
          ),
        ),
        body: Center(
            child: Container(
          alignment: Alignment.center,
          height: 200,
          width: 350,
          decoration: BoxDecoration(
            color: Color.fromARGB(210, 206, 221, 240),
            border: Border.all(width: 5, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 180,
                left: 10,
                child: Container(
                  height: 35,
                  width: 110,
                  child: Text(
                    customer.name ?? "無",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Positioned(
                bottom: 130,
                left: 50,
                child: Text(
                  '電話',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 130,
                left: 120,
                child: Text(
                  customer.telphone ?? "無",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 50,
                child: Text(
                  '地址',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 120,
                child: Text(
                  customer.address ?? "無",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 50,
                child: Text(
                  '優惠',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 120,
                child: Text(
                  customer.preferential ?? "無",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 50,
                child: Text(
                  '備註',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 120,
                child: Text(
                  customer.remark ?? "無",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
            ],
          ),
        )));
  }
}
