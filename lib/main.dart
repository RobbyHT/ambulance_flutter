import 'package:ambulance_flutter/api/services.dart';
import 'package:ambulance_flutter/bloc/theme/theme_bloc.dart';
import 'package:ambulance_flutter/home.dart';
import 'package:ambulance_flutter/bloc_observer.dart';
import 'package:ambulance_flutter/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/users/users_bloc.dart';
import 'setttings/preferencess.dart';

void main() async{
  //Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(User());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
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