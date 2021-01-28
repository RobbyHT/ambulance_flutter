import 'dart:async';
import 'dart:io';

import 'package:ambulance_flutter/api/exceptions.dart';
import 'package:ambulance_flutter/api/user_services.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepo usersRepo;
  List<User> users;

  UsersBloc({this.usersRepo}) : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    switch(event){
      case UsersEvent.fetchUsers:
        yield UsersLoading();
        try {
          users = await usersRepo.getUserList();
          yield UsersLoaded(users: users);
        } on SocketException {
          yield UsersListError(
            error: NoInternetException('No Internet')
          );
        } on HttpException{
          yield UsersListError(
            error: NoServiceFoundException('No Service Found')
          );
        } on FormatException{
          yield UsersListError(
            error: InvalidFormatException('Invalid Response format')
          );
        } catch (e){
          yield UsersListError(
            error: UnknownException('Unknown Error')
          );
        }
        break;
    }
  }
}
