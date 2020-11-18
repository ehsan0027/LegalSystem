import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository;

  LoginBloc({this.authRepository}) : super(LoginInitial());


  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUser) {
      yield LoginProcesssing();
      final String msg = await authRepository.userAuth(event.email,event.password);
      print("email : ${event.email}");
      print("Login msg:$msg");
      yield LoginDone(msg: "hi");
    }
  }

}
