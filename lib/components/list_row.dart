import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/components/txt.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  final User user;
  ListRow({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Text('${user.userId}'),
          Text(
            user.title,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Txt(
            text: user.title,
          ),*/
          Divider(),
        ],
      ),
    );
  }
}
