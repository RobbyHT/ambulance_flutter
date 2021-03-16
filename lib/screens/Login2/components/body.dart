import 'package:ambulance_flutter/screens/Welcom/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_flutter/Screens/Login2/components/background.dart';
import 'package:ambulance_flutter/Screens/singUp/signup_screen.dart';
import 'package:ambulance_flutter/components/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/components/rounded_button.dart';
import 'package:ambulance_flutter/components/rounded_input_field.dart';
import 'package:ambulance_flutter/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent[100],fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
            bottom: 80,
            left: 50,
            child: Image.asset(
              "assets/images/back-11.png",
              width: size.width * 0.5,
            ),
          ),    
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
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
            borderSide: BorderSide(color: Colors.red[200], width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('Login'),
            textColor: Colors.teal[300],                        
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
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
                      return SignUpScreen();
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
