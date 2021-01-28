import 'package:ambulance_flutter/bloc/users/users_bloc.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUsers();
  }

  _loadUsers() async{
    context.bloc<UsersBloc>().add(UsersEvent.fetchUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用者'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body(){
    return Column(
      children: [
        BlocBuilder<UsersBloc, UsersState>(builder: (BuildContext context, UsersState state){
          if(state is UsersListError){
            final error = state.error;
            return Text(error.message);
          }
          if(state is UsersLoaded){
            List<User> users = state.users;
            return _list(users);
          }
          return CircularProgressIndicator();
        }),
      ],
    );
  }
}

Widget _list(List<User> users){
  return Expanded(
    child: ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index){
        User user = users[index];
        return Text("我是 "+user.name);
      },
    ),
  );
}