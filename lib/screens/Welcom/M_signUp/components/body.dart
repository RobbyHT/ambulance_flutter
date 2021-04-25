import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_input_field.dart';
import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_password_field.dart';
import 'package:ambulance_flutter/screens/Welcom/M_Login/m_login_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/M_signUp/components/social_icon.dart';
import 'package:ambulance_flutter/screens/Welcom/mangementWelcome/mangementWelcome_screen.dart';

import 'package:flutter/material.dart';
import 'background.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            // Text(
            //   "註冊",
            //   style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(249,244,241,1),fontSize: 20),
            //             ),
            SizedBox(height: size.height * 0.03),
            Positioned(
            bottom: 80,
            left: 50,
            child: Image.asset(
              "assets/images/DarkBluePhone.png",
              width: size.width * 0.5,
            ),
          ),       
            // SvgPicture.asset(
            //   "assets/icons/Ambulance-cute.svg",
            //   height: size.height * 0.2,
            // ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "帳號",
              onChanged: (value) {},
            ),
            // SizedBox(height: size.height * 0.005),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.01),
            Container(
            width: 200.0,
            height: 50.0,
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: SizedBox.expand(
              child: OutlineButton(
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            ),
            borderSide: BorderSide(color: Color.fromRGBO(249,244,241,1), width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('註冊'),
            textColor: Color.fromRGBO(249,244,241,1),                        
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MangementWelcomeScreen();
                    },
                  ),
                );},
            ),
  )
) ,
             SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return M_LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
