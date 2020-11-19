import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/dashboard_res.dart';
import 'package:legal_system/repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardRepo dashboardRepo;

  DashboardBloc({this.dashboardRepo}) : super(DashboardInitial());


  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {

    if(event is GetAllCases)
      {
        yield DashboardInitial();
        final  res = await dashboardRepo.getDashboardData();
        if(res != null) {
          yield DashboardLoaded(dashboardRes: res);
        }else {
          print("Error...");
          yield DashboardError();
        }

      }
  }

}
