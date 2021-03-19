import 'package:ambulance_flutter/components/Welcom_components/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.grey[300],
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.deepOrange[200],
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.deepOrange[200],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
