import 'package:flutter/material.dart';

import 'client_data.dart';

class ClientData extends StatefulWidget {
  ClientData({Key key}) : super(key: key);

  ClientState createState() => ClientState();
}

class ClientState extends State<ClientData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(147, 20, 39, 79),
      appBar: new AppBar(
        elevation: 0,
        title: Text('顧客管理', style: TextStyle(fontSize: 20)),
        backgroundColor: Color.fromARGB(147, 57, 72, 103),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: clientsdata.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return clientsdata[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> clientsdata = [];

  void getPostsData() {
    List<dynamic> responseList = CLIENT_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
        height: 150,
      ));
    });
  }
}
