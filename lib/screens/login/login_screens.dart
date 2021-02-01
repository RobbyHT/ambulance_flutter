import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/components/link_btn.dart';
import 'package:ambulance_flutter/components/tf.dart';
import 'package:ambulance_flutter/home.dart';
import 'package:ambulance_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _accountController;
  TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPress: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
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
              onPress: (){
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}
