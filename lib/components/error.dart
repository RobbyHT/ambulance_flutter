import 'package:flutter/material.dart';

class ErrorTXT extends StatelessWidget {
  final String message;
  final Function onTap;
  ErrorTXT({this.message, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
