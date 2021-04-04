import 'package:ambulance_flutter/bloc/theme/theme_bloc.dart';
import 'package:ambulance_flutter/bloc/users/users_bloc.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/setttings/app_themes.dart';
import 'package:ambulance_flutter/setttings/preferencess.dart';
import 'package:ambulance_flutter/components/error.dart';
import 'package:ambulance_flutter/components/list_row.dart';
import 'package:ambulance_flutter/components/loading.dart';
import 'package:ambulance_flutter/components/txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadUsers();
  }

  _loadTheme() async {
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  _loadUsers() async {
    context.bloc<UsersBloc>().add(UsersEvent.fetchUsers);
  }

  _setTheme(bool darkTheme) {
    AppTheme cutTheme = darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: cutTheme));
    Preferences.saveTheme(cutTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: '使用者'),
        actions: [
          Switch(
            value: Preferences.getTheme() == AppTheme.lightTheme,
            onChanged: (val) {
              _setTheme(val);
            },
          )
        ],
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<UsersBloc, UsersState>(
            builder: (BuildContext context, UsersState state) {
          if (state is UsersListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTXT(
              message: message,
              onTap: _loadUsers,
            );
          }
          if (state is UsersLoaded) {
            List<User> users = state.users;
            return _list(users);
          }
          return Loading();
        }),
      ],
    );
  }
}

Widget _list(List<User> users) {
  return Expanded(
    child: ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        User user = users[index];
        return ListRow(user: user);
      },
    ),
  );
}
