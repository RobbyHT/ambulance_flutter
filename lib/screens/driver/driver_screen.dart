import 'package:ambulance_flutter/screens/driver/components/bottom_nav_bar.dart';
import 'package:ambulance_flutter/screens/driver/components/category_card.dart';
import 'package:ambulance_flutter/screens/driver/components/search_bar.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            //// Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(
                (0xFFF5CEB8),
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(
                          (0xFFF2BEA1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          icon: Icon(Icons.settings),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () {}),
                    ),
                  ),
                  Text(
                    "醫指派/司機 ",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Container(
                      child: Text(
                        '公告',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 250, 235, 215),
                        boxShadow: [
                          //BoxShadow(color: Colors.green, spreadRadius: 3),
                        ],
                      ),
                      height: 180,
                      width: 450,
                      margin: EdgeInsets.only(bottom: 50)),
                  Container(
                      child: Text(
                        '接單',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 250, 235, 215),
                        boxShadow: [
                          //BoxShadow(color: Colors.green, spreadRadius: 3),
                        ],
                      ),
                      height: 180,
                      width: 450,
                      margin: EdgeInsets.only(bottom: 30)),

                  /* Container(
                    alignment: Alignment.center,
                    color: Colors.amber[100],
                    child: Text('公告'),
                    constraints: BoxConstraints(
                        maxWidth: 450,
                        maxHeight: 150,
                        minWidth: 50,
                        minHeight: 50),
                    margin: EdgeInsets.only(bottom: 40),
                  ),*/
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        /*FlatButton(
                          color: Colors.blueAccent,
                          child: Text("1"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),*/
                        /* IconButton(
                            icon: Icon(Icons.directions_bus),
                            iconSize: 40.0,
                            color: Colors.red,
                            onPressed: () {}),
                        */
                        /*CategoryCard(
                          title: "個人車趟",
                          iconSrc: Icons.ac_unit_sharp,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                //return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "公告管理",
                          iconSrc: Icons.ac_unit_sharp,
                          press: () {},
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
