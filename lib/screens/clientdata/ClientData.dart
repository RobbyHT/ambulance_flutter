import 'package:ambulance_flutter/models/customer.dart';
import 'package:ambulance_flutter/screens/clientdata/clientonly.dart';
import 'package:ambulance_flutter/utils/user_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'client_data.dart';

class ClientData extends StatefulWidget {
  @override
  ClientState createState() => ClientState();
}

class ClientState extends State<ClientData> {
  List<Customer> responseList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCustomerList().then((val) => setState(() {
            responseList = val;
          }));
    });
  }

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
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.search_rounded,
        //       color: Colors.white,
        //       size: 35.0,
        //     ),
        //     onPressed: () {
        //       //
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: responseList.length,
        itemBuilder: (context, index) {
          Customer customer = responseList[index];
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
                customer.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '電話  ' + customer.telphone,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  height: 2.0,
                ),
              ),
              leading: Icon(
                Icons.person_rounded,
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
                        builder: (context) => ClientOnlyScreen(customer)));
              },
            ),
          );
        },
      ),
    );
  }
}
