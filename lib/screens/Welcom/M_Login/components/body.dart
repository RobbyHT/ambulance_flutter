import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_input_field.dart';
import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_password_field.dart';
import 'package:ambulance_flutter/screens/Welcom/M_Login/components/background.dart';
import 'package:ambulance_flutter/screens/Welcom/M_signUp/M_signup_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/mangementWelcome/mangementWelcome_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "登入",
              style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(249,224,241,100),fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
            bottom: 80,
            left: 50,
            child: Image.asset(
              "assets/images/DarkBluePhone.png",
              width: size.width * 0.6,
            ),
          ),    
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "帳號",
              onChanged: (value) {},
            ),
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
            borderSide: BorderSide(color: Color.fromRGBO(249,224,241,100), width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('登入'),
            textColor: Color.fromRGBO(249,224,241,100),                        
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MangementWelcomeScreen();
                                },
                              ),
                            );
                            },
                        ),
              )
            ) ,
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MSignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
