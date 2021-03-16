import 'package:flutter/material.dart';
import 'package:ambulance_flutter/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.deepOrange[200],
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.deepOrange[200],
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
