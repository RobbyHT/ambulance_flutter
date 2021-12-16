import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class EmtSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "設定",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        toolbarHeight: 60.0,
        backgroundColor: Color.fromARGB(180, 255, 127, 36),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: '個人資訊',
            tiles: [
              SettingsTile(
                  title: Auth.user.name.toString(),
                  subtitle: '女/醫護人員',
                  leading: Icon(Icons.person)),
              SettingsTile(
                  title: '帳號',
                  subtitle: Auth.user.account.toString(),
                  leading: Icon(Icons.account_box_rounded)),
            ],
          ),
          SettingsSection(
            title: '語言',
            tiles: [
              SettingsTile(
                title: '語言',
                subtitle: '中文',
                leading: Icon(Icons.language),
              ),
              // SettingsTile.switchTile(
              //   title: 'Use System Theme',
              //   leading: Icon(Icons.phone_android),
              //   switchValue: isSwitched,
              //   onToggle: (value) {
              //     setState(() {
              //       isSwitched = value;
              //     });
              //   },
              // ),
            ],
          ),
          SettingsSection(
            title: '隱私',
            tiles: [
              SettingsTile(
                title: '安全性',
                subtitle: '指紋',
                leading: Icon(Icons.lock),
              ),
              SettingsTile.switchTile(
                title: '使用指紋',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
