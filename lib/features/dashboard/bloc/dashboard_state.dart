part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}
class DashboardLoaded extends DashboardState {
 DashboardRes dashboardRes;

  DashboardLoaded({this.dashboardRes});

  @override
  List<Object> get props => [dashboardRes];
}
class DashboardError extends DashboardState {
  @override
  List<Object> get props => [];
}
