import 'package:flutter/material.dart';

import 'components/already_have_an_account_acheck.dart';
import 'components/background.dart';
import 'components/dropDown_1.dart';
import 'components/or_divider.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_input_field_other.dart';
import 'components/rounded_password_field.dart';
import 'components/social_icon.dart';
import 'login_screen.dart';

class SingUpScreen extends StatelessWidget {
  int sex = 1;
  String dropdownValue = 'EMT-1';
  var _lience = ['EMT-1', 'EMT-2', '其他'];
  // var _lienceSelected="EMT-1";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.08),
              // Text(
              //   "註冊",
              //   style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromRGBO(234,114,122,1),fontSize: 20),
              //             ),
              SizedBox(height: size.height * 0.03),
              Container(
                margin: EdgeInsets.only(bottom: 80, left: 50),
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
              chooseSex(),
              RoundedInputField(
                //輸入姓名
                hintText: "姓名",
                onChanged: (value) {},
              ),
              // SizedBox(height: size.height * 0.005),
              //輸入密碼
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.01),
              //輸入生日
              RoundedInputFieldOther(
                hintText: "生日",
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.01),
              //輸入身分證字號
              RoundedInputFieldOther(
                hintText: "身分證字號",
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.01),
              //輸入證照
              DropDown1(),
              SizedBox(height: size.height * 0.01),
              //輸入證照到期日
              RoundedInputFieldOther(
                hintText: "證照到期日",
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.01),
              //輸入公司金鑰
              RoundedInputFieldOther(
                hintText: "公司金鑰",
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
                      borderSide: BorderSide(
                          color: Color.fromRGBO(234, 114, 122, 1), width: 3),
                      disabledBorderColor: Colors.black,
                      highlightedBorderColor: Colors.red,
                      child: Text('註冊'),
                      textColor: Color.fromRGBO(150, 150, 150, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              //return WelcomeScreen();
                            },
                          ),
                        );
                      },
                    ),
                  )),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class chooseSex extends StatefulWidget {
  @override
  _chooseSexState createState() => _chooseSexState();
}

class _chooseSexState extends State<chooseSex> {
  int sex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("司機"),
          Radio(
            value: 1,
            groupValue: this.sex,
            onChanged: (value) {
              setState(() {
                this.sex = value;
              });
            },
          ),
          SizedBox(width: 20),
          Text("醫護人員"),
          Radio(
            value: 2,
            groupValue: this.sex,
            onChanged: (value) {
              setState(() {
                this.sex = value;
              });
            },
          ),
        ],
      ),
    ));
  }
}
