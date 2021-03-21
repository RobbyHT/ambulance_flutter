import 'package:ambulance_flutter/screens/driver/components/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final IconData iconSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange, //按鈕背景顏色
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  IconButton(
                      icon: Icon(iconSrc),
                      iconSize: 40.0,
                      color: Color.fromARGB(255, 255, 00, 00), //icon
                      onPressed: () {}),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
