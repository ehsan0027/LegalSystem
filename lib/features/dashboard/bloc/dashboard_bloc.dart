import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {

    if(event is GetAllCases)
      {
        yield DashboardInitial();
        final String res= await _getAllCases();
        yield DashboardLoaded(msg: res);

      }
  }

  Future<String> _getAllCases() {
    return Future.delayed(Duration(seconds: 2), () {
      return "getting data....";
    });
  }
}
