import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/utils/user_util.dart';
import 'package:flutter/material.dart';
import 'empData.dart';
import 'empReturn.dart';

class EmpPage extends StatefulWidget {
  @override
  _empPageState createState() => _empPageState();
}

class _empPageState extends State<EmpPage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];
  List<User> responseList = [];

  void getPostsData() {
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 140,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color.fromRGBO(155, 164, 180, 1),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                      ),
                      iconSize: 55,
                    ),
                    Text(
                      post.permission,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      post.name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "電話：${post.telphone}",
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmpReturn(user: post)));
                  },
                )
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserList().then((val) => setState(() {
            responseList = val;
          }));
    });

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 72, 103, 10),
      appBar: AppBar(
        elevation: 0,
        title: Text('員工管理', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(31, 60, 136, 40),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: responseList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      if (topContainer > 0.5) {
                        scale = index + 0.5 - topContainer;
                        if (scale < 0) {
                          scale = 0;
                        } else if (scale > 1) {
                          scale = 1;
                        }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.7,
                              alignment: Alignment.topCenter,
                              child: Container(
                                  height: 140,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      color: Color.fromRGBO(155, 164, 180, 1),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(100),
                                            blurRadius: 10.0),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                Icons.person_rounded,
                                                color: Colors.white,
                                              ),
                                              iconSize: 55,
                                            ),
                                            Text(
                                              responseList[index].permission,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              responseList[index].name,
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              "電話：${responseList[index].telphone}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            // SizedBox(
                                            //   height: 10,
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.keyboard_arrow_right,
                                              color: Colors.white),
                                          iconSize: 40,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EmpReturn(
                                                            user: responseList[
                                                                index])));
                                          },
                                        )
                                      ],
                                    ),
                                  ))),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
