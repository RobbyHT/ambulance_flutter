import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50,
            left: 0,
            child: Image.asset(
              "assets/images/back-18.png",
              width: size.width * 1,
            ),
          ),
          Positioned(
            bottom: -12,
            right: 0,
            child: Image.asset(
              "assets/images/back-16.png",
              width: size.width * 1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
