import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/models/dispatch_emt.dart';
import 'package:ambulance_flutter/models/user.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'driver_home_screen.dart';
import 'driver_main_screen.dart';
import 'driver_running_screen.dart';

class ChooseEMTScreen extends StatefulWidget {
  ChooseEMTScreen({Key key, this.dispatch}) : super(key: key);

  Dispatch dispatch;

  @override
  _ChooseEMTScreenState createState() => _ChooseEMTScreenState();
}

class _ChooseEMTScreenState extends State<ChooseEMTScreen> {
  List<User> user;
  List<int> addId = [];
  Color bgc = Color(0xFFFFEFEE);
  DispatchEMT dispatchEMT = DispatchEMT();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('選擇醫護人員'),
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.3,
            child: FutureBuilder<List<User>>(
                future: UserServices().getEMTList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    this.user = snapshot.data;
                    return ListView.builder(
                      itemCount: this.user.length,
                      itemBuilder: (_, index) {
                        User user = this.user[index];
                        return GestureDetector(
                          onTap: () {
                            int index = this.addId.indexOf(user.id);
                            if (index == -1) {
                              setState(() {
                                this.addId.add(user.id);
                              });
                            } else {
                              setState(() {
                                this.addId.removeAt(index);
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 5.0, bottom: 5.0, right: 20.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                color: this.addId.indexOf(user.id) == -1
                                    ? Color(0xFFFFEFEE)
                                    : Colors.yellow,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundColor:
                                      Color.fromARGB(180, 255, 127, 36),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Text(
                                  user.name,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Btn(
            text: '送出',
            color: Color.fromARGB(180, 255, 127, 36),
            onPress: () {
              dispatchEMT.dispatchId = widget.dispatch.id;
              dispatchEMT.userId = addId;
              dispatchEMT.state = 1;
              DispatchServices().updDispatch(widget.dispatch.id, 2);
              DispatchServices().insDispatchEMT(dispatchEMT);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DriverRunningScreen(
                    dispatch: widget.dispatch,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
