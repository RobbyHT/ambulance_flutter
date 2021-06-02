import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.controller,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.grey[300],
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(234, 114, 122, 1),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
