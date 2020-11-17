import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUser) {
      yield LoginProcesssing();
      final String msg = await startLogin(event.email,event.password);
      print("email : ${event.email}");
      print("Login msg:$msg");
      yield LoginDone(msg: "hi");
    }
  }

  Future<String> startLogin(String email,String password) {
    return Future.delayed(Duration(seconds: 2), () {
      return "Login Successful";
    });
  }
}
