import 'package:ambulance_flutter/screens/clientdata/ClientData.dart';
import 'package:ambulance_flutter/screens/clientdata/client_data.dart';
import 'package:flutter/material.dart';

class ClientOnlyScreen extends StatelessWidget {
  final Clientdata client;
  final myController = TextEditingController();

  ClientOnlyScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(7, 13, 89, 205),
        appBar: AppBar(
          elevation: 0,
          title: Text('顧客管理', style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(50, 64, 125, 103),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClientData()));
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
                    client.name,
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
                left: 80,
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
                left: 150,
                child: Text(
                  client.phone,
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
                left: 80,
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
                left: 150,
                child: Text(
                  client.address,
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
                left: 80,
                child: Text(
                  '優惠價',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79)),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 150,
                child: Text(
                  client.discount,
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
                left: 80,
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
                left: 150,
                child: Text(
                  client.other,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(220, 20, 39, 79),
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(230, 20, 39, 79)),
                ),
              ),
              Positioned(
                top: 220,
                left: 80,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClientData()));
                  },
                ),
              ),
              Positioned(
                top: 220,
                left: 180,
                child: IconButton(
                  icon: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )));
  }
}
