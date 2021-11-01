import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/bloc/theme/theme_bloc.dart';
import 'package:ambulance_flutter/home.dart';
import 'package:ambulance_flutter/screens/dispatch/datetime_screen.dart';
import 'package:ambulance_flutter/screens/manager/manager_equipment_screen.dart';
import 'package:ambulance_flutter/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/users/users_bloc.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            title: 'Flutter Bloc Demo',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: BlocProvider(
              create: (context) => UsersBloc(usersRepo: UserServices()),
              child: UsersScreen(),
            ),
          );
        },
      ),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
