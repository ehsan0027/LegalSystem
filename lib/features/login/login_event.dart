part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}

class LoginUser extends LoginEvent {
  final String email;
  final String password;

  LoginUser({this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => [email,password];
}
class HandleException extends LoginEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
