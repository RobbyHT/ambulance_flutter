import 'package:ambulance_flutter/screens/clientdata/clientonly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'client_data.dart';

class ClientData extends StatefulWidget {
  @override
  ClientState createState() => ClientState();
}

class ClientState extends State<ClientData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView.builder(
              itemCount: CLIENT_DATA.length,
              itemBuilder: (context, index) {
                Clientdata client = CLIENT_DATA[index];
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
                      client.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '電話  ' + client.phone,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        height: 2.0,
                      ),
                    ),
                    leading: Icon(
                      Icons.person,
                      size: 50,
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
                              builder: (context) => ClientOnlyScreen(client)));
                    },
                  ),
                );
              })),
    );
  }
}
