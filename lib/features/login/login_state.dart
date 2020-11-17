part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginProcesssing extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginDone extends LoginState {
  String msg;
  LoginDone({this.msg}):super();

  @override
  // TODO: implement props
  List<Object> get props => [msg];
}
