import 'package:ambulance_flutter/screens/clientdata/ClientData.dart';
import 'package:ambulance_flutter/screens/clientdata/client_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ClientOnlyScreen extends StatelessWidget {
  final Clientdata client;

  ClientOnlyScreen(this.client);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(160, 20, 39, 79),
      appBar: AppBar(
        elevation: 0,
        title: Text('顧客管理', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(147, 57, 72, 103),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ClientData()));
          },
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Color.fromARGB(210, 206, 221, 240),
              border: Border.all(width: 4, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          Positioned(
            top: 180,
            left: 50,
            child: Container(
              height: 35,
              width: 110,
              child: Text(
                client.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
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
            top: 240,
            left: 100,
            child: Text(
              '電話',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(220, 20, 39, 79)),
            ),
          ),
          Positioned(
            top: 270,
            left: 100,
            child: Text(
              '地址',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(220, 20, 39, 79)),
            ),
          ),
          Positioned(
            top: 300,
            left: 100,
            child: Text(
              '優惠價',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(220, 20, 39, 79)),
            ),
          ),
          Positioned(
            top: 330,
            left: 100,
            child: Text(
              '備註',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(220, 20, 39, 79)),
            ),
          ),
        ]),
      ),
    );
  }
}
