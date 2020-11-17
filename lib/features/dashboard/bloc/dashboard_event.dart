part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class GetAllCases extends DashboardEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
