import 'package:ambulance_flutter/api/dispatch_services.dart';
import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/models/user.dart';
import 'package:ambulance_flutter/screens/dispatch/datetime_screen.dart';
import 'package:ambulance_flutter/screens/manager/manager_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/models.dart';

class ChooseDriveScreen extends StatelessWidget {
  ChooseDriveScreen({Key key, this.dispatch}) : super(key: key);

  Dispatch dispatch;

  List<User> user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('選擇司機'),
        backgroundColor: Color.fromRGBO(31, 60, 136, 1),
      ),
      body: FlutterEasyLoading(
        child: FutureBuilder<List<User>>(
            future: UserServices().getDriverList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                this.user = snapshot.data;
                return ListView.builder(
                  itemCount: this.user.length,
                  itemBuilder: (_, index) {
                    User user = this.user[index];
                    return GestureDetector(
                      onTap: () {
                        // 可以新增進資料庫了
                        //DispatchServices().insDispatch(dispatch);
                        dispatch.driverId = user.id;
                        dispatch.userId = 1; //TODO 製作登入之使用者
                        dispatch.state = 1;
                        DispatchServices().insDispatch(dispatch);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => DatetimeScreen()),
                            (route) => false);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ManagerHomeScreen()),
                        // );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFEFEE),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 35.0,
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
      /*body: Stack(
        children: [
          Column(
            children: [
              drive_list("林Ｏ霆"),
              drive_list("豬Ｏ筠"),
              drive_list("廖Ｏ翔"),
            ],
          ),
        ],
      ),*/
    );
  }

  /*Slidable drive_list(String name) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          )
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 4),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }*/
}
