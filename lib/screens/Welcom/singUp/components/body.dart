import 'package:ambulance_flutter/components/Welcom_components/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/components/Welcom_components/rounded_input_field.dart';
import 'package:ambulance_flutter/components/Welcom_components/rounded_password_field.dart';
import 'package:ambulance_flutter/screens/Welcom/Login2/login_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/singUp/components/social_icon.dart';
import 'package:ambulance_flutter/screens/Welcom/welcome_screen.dart';
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
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent[100],fontSize: 20),
                        ),
            SizedBox(height: size.height * 0.03),
            Positioned(
            bottom: 80,
            left: 50,
            child: Image.asset(
              "assets/images/phone.png",
              width: size.width * 0.5,
            ),
          ),       
            // SvgPicture.asset(
            //   "assets/icons/Ambulance-cute.svg",
            //   height: size.height * 0.2,
            // ),
            SizedBox(height: size.height * 0.01),
            RoundedInputField(
              hintText: "Your Email",
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
            borderSide: BorderSide(color: Colors.red[200], width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('sign up'),
            textColor: Color.fromRGBO(133,163,146,1),                        
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
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
                      return Login2Screen();
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
