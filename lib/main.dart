import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/bloc/theme/theme_bloc.dart';
import 'package:ambulance_flutter/screens/dispatch/datetime_screen.dart';
import 'package:ambulance_flutter/screens/login/login_screen.dart';
import 'package:ambulance_flutter/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/users/users_bloc.dart';
import 'screens/driver/driver_main_screen.dart';
import 'screens/manager/car_manage.dart';
import 'screens/manager/manager_main_screen.dart';
import 'setttings/preferencess.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MaterialApp(
      initialRoute: '/car_manage',
      routes: {
        '/login': (context) => LoginScreen(),
        '/manager_home': (context) => ManagerMainScreen(),
        '/driver_home': (context) => DriverMainScreen(),
        '/datetime': (context) => DatetimeScreen(),
        '/car_manage': (context) => CarManageScreen(),
        // '/car_detailed': (context) => CarDetailedScreen(),
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

/*class CarDetailedScreen {
}*/

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
