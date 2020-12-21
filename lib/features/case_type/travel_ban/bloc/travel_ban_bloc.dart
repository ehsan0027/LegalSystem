import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/travel_ban_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'travel_ban_event.dart';

part 'travel_ban_state.dart';

class TravelBanBloc extends Bloc<TravelBanEvent, TravelBanState> {
  CaseTypeRepo caseTypeRepo;

  TravelBanBloc({this.caseTypeRepo}) : super(TravelBanInitial());

  @override
  Stream<TravelBanState> mapEventToState(
    TravelBanEvent event,
  ) async* {
    if (event is GetTravelBanCases) {
      final res = await caseTypeRepo.getTravelBanCases();
      if (res != null) {
        yield TravelBanLoaded(travelBanRes: res);
      } else {
        yield TravelBanError();
      }
    }
  }
}
