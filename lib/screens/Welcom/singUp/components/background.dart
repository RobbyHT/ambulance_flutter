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
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 30,
            left:-20,
            child: Image.asset(
              "assets/images/virtualLine.png",
              width: size.width * 1.2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            child: Image.asset(
              "assets/images/underLineAcross.png",
              width: size.width * 0.9,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
