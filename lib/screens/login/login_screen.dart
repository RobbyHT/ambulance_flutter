import 'package:ambulance_flutter/api/login_services.dart';
import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/components/link_btn.dart';
import 'package:ambulance_flutter/components/tf.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_flutter/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _accountController;
  TextEditingController _passwordController;
  int error_num = 0;
  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: Scaffold(
        appBar: AppBar(
          title: Text('登入'),
        ),
        body: Container(
          child: Column(
            children: [
              TF(
                controller: _accountController,
                helpText: '',
                hintText: '員工編號',
                prefixIcon: Icons.account_circle,
              ),
              TF(
                controller: _passwordController,
                helpText: '',
                hintText: '身分證字號',
                isPassword: true,
                prefixIcon: Icons.lock,
              ),
              Row(
                children: [
                  Expanded(
                    child: Btn(
                      onPress: () async {
                        setState(() {
                          error_num++;
                        });
                        EasyLoading.show(status: '身分驗證中請稍後...');
                        LoginServices loginService = LoginServices.init();
                        bool result = await loginService.signIn(
                            _accountController.text, _passwordController.text);
                        if (result) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } else {
                          EasyLoading.showError('帳號或密碼錯誤，請重新輸入！\r\n嘗試輸入錯誤5次，將鎖定帳號：${this.error_num}次');
                        }
                        EasyLoading.dismiss();
                      },
                      text: 'Login',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              LinkBtn(
                text: 'sing up',
                color: Colors.blue,
                onPress: () {
                  //
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
