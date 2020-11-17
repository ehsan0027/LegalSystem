part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginProcesssing extends LoginState {}

class LoginDone extends LoginState {
  String msg;
  LoginDone({this.msg}):super();
}
