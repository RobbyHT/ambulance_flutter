import 'package:ambulance_flutter/components/Welcom_components/text_field_container.dart';
import 'package:flutter/material.dart';

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
        cursorColor: Color.fromRGBO(234,114,122,1),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromRGBO(234,114,122,1),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
