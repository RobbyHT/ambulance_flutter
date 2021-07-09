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
                  margin: EdgeInsets.only(left: 60, right: 60, top: 25),
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
                  ),
                );
              })
          /* Container(
          height: 110,
          margin: EdgeInsets.only(left: 40, right: 40, top: 25, bottom: 20),
          decoration: BoxDecoration(
            color: Color.fromARGB(170, 155, 164, 181),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return itemsData[index];
                  }),
            ],
          ),
        ),*/
          ),
    );
  }

  /*ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = CLIENT_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }*/

}
