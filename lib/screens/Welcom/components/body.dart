import 'package:ambulance_flutter/components/Welcom_components/already_have_an_account_acheck.dart';
import 'package:ambulance_flutter/screens/Welcom/Login2/login_screen.dart';
import 'package:ambulance_flutter/screens/Welcom/components/background.dart';
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
            Text(
              "醫指派",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent[100],fontSize: 20),
            ),
            SizedBox(height: size.height * 0.1),
            // SvgPicture.asset(
            //   "assets/images/back-17.png",
            //   height: size.height *0.3,
            // ),  
            Positioned(
            bottom: 50,
            left: 50,
            child: Image.asset(
              "assets/images/ambulance.png",
              width: size.width * 0.7,
            ),
          ),          
            SizedBox(height: size.height * 0.08),
           
          Container(
            width: 150.0,
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
            child: Text('LOGIIN'),
            textColor: Color.fromRGBO(133,163,146,1),
                        
            onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login2Screen();
                    },
                  ),
                );},
            ),
  )
) ,
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
            borderSide: BorderSide(color: Colors.red[200], width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('Sing up'),
            textColor: Color.fromRGBO(133,163,146,1),
            
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
  )
),    
            SizedBox(height: size.height * 0.03),
            TextButton(
                onPressed: () {},
                child: Text('管理者登入'),
                style: TextButton.styleFrom(
                  primary: Color.fromRGBO(133,163,146,1) ,
                  textStyle: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                ) ,
              
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
