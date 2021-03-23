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
            top: -20,
            left: -30,
            child: Image.asset(
              "assets/images/LightBlueLine_across.png",
              width: size.width * 0.5,
            ),
          ),
          Positioned(
            bottom: -15,
            right: 0,
            child: Image.asset(
              "assets/images/LightBlueLine_underAcross.png",
              width: size.width * 1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
