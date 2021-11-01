import 'package:ambulance_flutter/api/login_services.dart';
import 'package:ambulance_flutter/db/user_lite.dart';
import 'package:ambulance_flutter/models/user.dart';
import 'package:ambulance_flutter/screens/driver/driver_main_screen.dart';
import 'package:ambulance_flutter/screens/emt/emt_main_screen.dart';
import 'package:ambulance_flutter/screens/login/components/background.dart';
import 'package:ambulance_flutter/screens/manager/manager_main_screen.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_password_field.dart';
import 'singup_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _accountController =
      TextEditingController(text: 'admin001');
  TextEditingController _passwordController =
      TextEditingController(text: 'A123456789');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return FlutterEasyLoading(
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.02),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 0, left: 0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: size.width * 0.4,
                  ),
                ),
                SizedBox(height: size.height * 0.009),
                Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Image.asset(
                    "assets/images/road.png",
                    width: size.width * 1.2,
                    height: size.height * 0.28,
                  ),
                ),
                RoundedInputField(
                  controller: _accountController,
                  hintText: "帳號",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: _passwordController,
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  width: 150.0,
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
                      child: Text('登入'),
                      textColor: Color.fromRGBO(150, 150, 150, 1),
                      onPressed: () async {
                        await DBHelper.delete('userList');
                        EasyLoading.show(status: '身分驗證中請稍後...');
                        LoginServices loginService = LoginServices.init();
                        String result = await loginService.signIn(
                            _accountController.text, _passwordController.text);

                        await DBHelper.getData('userList').then((value) => {
                              Auth.user = User.fromJson(value[0]),
                              print(value[0]['name'])
                            });
                        if (result == "admin") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManagerMainScreen(),
                            ),
                          );
                        } else if (result == "driver") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DriverMainScreen(),
                            ),
                          );
                        } else if (result == "EMT") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmtMainScreen(),
                            ),
                          );
                        } else {
                          EasyLoading.showError('帳號或密碼錯誤，請重新輸入！');
                        }
                        //EasyLoading.showInfo('請確認API狀態！！');
                        EasyLoading.dismiss();
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                TextButton(
                  child: Text('註冊'),
                  style: TextButton.styleFrom(
                    primary: Color.fromRGBO(150, 150, 150, 1),
                    textStyle:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SingUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
