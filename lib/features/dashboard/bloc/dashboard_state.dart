part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}
class DashboardLoaded extends DashboardState {

  String msg;

  DashboardLoaded({this.msg});

  @override
  List<Object> get props => [msg];
}
