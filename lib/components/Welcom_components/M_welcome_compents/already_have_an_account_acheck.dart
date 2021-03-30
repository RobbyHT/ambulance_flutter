import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: Color.fromRGBO(249,244,241,1),),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Log In" ,
            style: TextStyle(
              color: Color.fromRGBO(249,244,241,1),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
