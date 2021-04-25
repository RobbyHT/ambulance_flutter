import 'package:ambulance_flutter/components/Welcom_components/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/screens/Welcom/Login2/login_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/components/background.dart';
import 'package:ambulance_flutter/screens/Welcom/mangementWelcome/mangementWelcome_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/singUp/signup_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.02),
            Positioned(
              top: 10,
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/logo.png",
                width: size.width * 0.4,
              ),
            ),
            // Text(
            //   "醫指派",
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Color.fromRGBO(234,114,122,1),
            //       fontSize: 20),
            // ),
            SizedBox(height: size.height * 0.009),
            // SvgPicture.asset(
            //   "assets/images/back-17.png",
            //   height: size.height *0.3,
            // ),
            Positioned(
              bottom: 0,
              left: 50,
              child: Image.asset(
                "assets/images/road.png",
                width: size.width * 1.2,
                height:size.height*0.28 ,
              ),
            ),
            SizedBox(height: size.height * 0.05),

            Container(
                width: 150.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 3.0),
                child: SizedBox.expand(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    borderSide: BorderSide(color: Color.fromRGBO(234,114,122,1), width: 3),
                    disabledBorderColor: Colors.black,
                    highlightedBorderColor: Colors.red,
                    child: Text('登入'),
                    textColor: Color.fromRGBO(150,150,150,1), 
                    onPressed: () {
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
                )),
            SizedBox(height: size.height * 0.02),
            Container(
                width: 150.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(vertical: 3.0),
                child: SizedBox.expand(
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    borderSide: BorderSide(color: Color.fromRGBO(234,114,122,1), width: 3),
                    disabledBorderColor: Colors.black,
                    highlightedBorderColor: Colors.red,
                    child: Text('註冊'),
                    textColor: Color.fromRGBO(150,150,150,1), 
                    onPressed: () {
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
                )),
            SizedBox(height: size.height * 0.03),
            TextButton(
              child: Text('管理者登入'),
              style: TextButton.styleFrom(
                  primary: Color.fromRGBO(150,150,150,1), 
                  textStyle:
                      TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
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

            //     TextButton(
            //     onPressed: () {
            // // Respond to button press
            //     },
            //       child: Text("TEXT BUTTON"),
            //     )

            // RoundedButton(
            //   text: "LOGIN",
            //  color: Colors.orange[200],
            //   textColor: Colors.teal[700],
            //   // decoration: BoxDecoration(
            //   //   gradient: LinearGradient(
            //   //       colors: [
            //   //         Colors.teal,
            //   //         Colors.teal[200],
            //   //       ],
            //   //       begin: Alignment.topLeft,
            //   //       end: Alignment.bottomRight,
            //   //     ),),
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return LoginScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
            // RoundedButton(
            //   text: "SIGN UP",
            //   color: Colors.orange[200],
            //   textColor: Colors.black,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
