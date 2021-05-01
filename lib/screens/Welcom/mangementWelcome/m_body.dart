import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_input_field.dart';
import 'package:ambulance_flutter/components/Welcom_components/M_welcome_compents/rounded_password_field.dart';
import 'package:ambulance_flutter/screens/Welcom/mangementWelcome/background.dart';
import 'package:ambulance_flutter/screens/Welcom/welcome_screen.dart';
import 'package:flutter/material.dart';


class m_Body extends StatelessWidget {
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
                "assets/images/logo_blue.png",
                width: size.width * 0.4,
              ),
            ),
            // Text(
            //   "醫指派-管理者",
            //   style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(249,224,241,100) ,fontSize: 20),
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
              "assets/images/road_blue.png",
              width: size.width * 1.3,
              height:size.height*0.28 ,
            ),
          ),          
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "帳號",
              onChanged: (value) {},
            ),
            // SizedBox(height: size.height * 0.005),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
           SizedBox(height: size.height * 0.009),
          Container(
            width: 150.0,
            height: 50.0,
            margin: EdgeInsets.symmetric(vertical: 3.0),
            child: SizedBox.expand(
              child: OutlineButton(
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            ),
            borderSide: BorderSide(color: Color.fromRGBO(249,224,241,1), width: 3 ),
            disabledBorderColor: Colors.black,
            highlightedBorderColor: Colors.red,
            child: Text('登入'),
            textColor: Color.fromRGBO(249,224,241,1),
                        
            onPressed: () {Navigator.push(
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
           SizedBox(height: size.height * 0.02),
//            Container(
//             width: 150.0,
//             height: 50.0,
//             margin: EdgeInsets.symmetric(vertical: 3.0),
//             child: SizedBox.expand(
//               child: OutlineButton(
//                 shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//             ),
//             borderSide: BorderSide(color: Color.fromRGBO(249,224,241,1), width: 3 ),
//             disabledBorderColor: Colors.black,
//             highlightedBorderColor: Colors.red,
//             child: Text('註冊'),
//             textColor: Color.fromRGBO(249,224,241,1),
            
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return MSignUpScreen();
//                     },
//                   ),
//                 );
//                 },
//             ),
//   )
// ),    
            // SizedBox(height: size.height * 0.03),
            TextButton(
              child: Text('使用者登入'),
              style: TextButton.styleFrom(
                  primary: Color.fromRGBO(249,224,241,1),
                  textStyle:
                      TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
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
                ],
        ),
      ),
    );
  }
}
