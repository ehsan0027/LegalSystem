import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUser) {
      yield LoginProcesssing();
      final String msg = await startLogin();
      print("Login msg:$msg");
      yield LoginDone();
    }
  }

  Future<String> startLogin() {
    return Future.delayed(Duration(seconds: 3), () {
      return "Login Successful";
    });
  }
}
