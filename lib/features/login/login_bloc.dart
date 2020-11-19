import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/repository/auth_repository.dart';
import 'package:legal_system/utils/gv.dart';
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
      print("email : ${event.email}");
      print("password : ${event.password}");
      final loginRes = await authRepository.userAuth(event.email,event.password);
      print("login res in bloc ${loginRes}");
      if(loginRes != null)
        {
          GV.USER_TOKEN=loginRes.success.token;
          yield LoginDone(msg: "hi");
        }
      else if(loginRes == null) {
        print("Login Error...");
       yield LoginError(msg:"Something went wrong" );
      }
    }
    else if(event is HandleException)
      {
        yield LoginInitial();
      }
  }

}
