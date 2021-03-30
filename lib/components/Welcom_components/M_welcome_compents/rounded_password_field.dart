import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/text_field_container.dart';
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
          hintText: "密碼",
          icon: Icon(
            Icons.lock,
            color: Color.fromRGBO(0,80,134,1),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color.fromRGBO(0,80,134,1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
