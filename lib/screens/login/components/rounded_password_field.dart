import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  IconData _visibility = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        cursorColor: Colors.grey[300],
        decoration: InputDecoration(
          hintText: "密碼",
          icon: Icon(
            Icons.lock,
            color: Color.fromRGBO(234, 114, 122, 1),
          ),
          suffixIcon: IconButton(
              icon: Icon(
                _visibility,
                color: Color.fromRGBO(234, 114, 122, 1),
              ),
              onPressed: () {
                setState(() {
                  _obscureText
                      ? _visibility = Icons.visibility
                      : _visibility = Icons.visibility_off;
                  _obscureText = !_obscureText;
                });
              }),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
