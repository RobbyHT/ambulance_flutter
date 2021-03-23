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
            top: 45,
            left: 0,
            child: Image.asset(
              "assets/images/LightBlueLine.png",
              width: size.width * 1.1,
            ),
          ),
          Positioned(
            bottom: -12,
            right: -5,
            child: Image.asset(
              "assets/images/LightBlueLine_dot.png",
              width: size.width * 1.1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
