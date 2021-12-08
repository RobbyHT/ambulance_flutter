import 'package:ambulance_flutter/home.dart';
import 'package:ambulance_flutter/screens/dispatch/datetime_screen.dart';
import 'package:ambulance_flutter/screens/manager/manager_equipment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/analysis.dart';
import 'screens/clientdata/ClientData.dart';
import 'screens/dispatch/map2_screen.dart';
import 'screens/driver/driver_main_screen.dart';
import 'screens/driver/driver_running_screen.dart';
import 'screens/emp/emp.dart';
import 'screens/login/login_screen.dart';
import 'screens/manager/manager_main_screen.dart';
import 'setttings/preferencess.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/manager_home': (context) => ManagerMainScreen(),
        '/driver_home': (context) => DriverMainScreen(),
        '/datetime': (context) => DatetimeScreen(),
        '/map2': (context) => Map2View(),
        '/home': (context) => HomeScreen(),
        '/driver_map': (context) => DriverRunningScreen(),
        '/equipmentUI': (context) => ManagerEquipmentScreen(),
        '/ClientData': (context) => ClientData(),
        '/EmpPage': (context) => EmpPage(),
        '/Analysis': (context) => Analysis(),
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale('zh'),
      //home: ManagerMainScreen(),
    ),
  );
}
