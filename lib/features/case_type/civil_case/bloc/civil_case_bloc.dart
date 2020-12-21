import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/civil_case_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'civil_case_event.dart';

part 'civil_case_state.dart';

class CivilCaseBloc extends Bloc<CivilCaseEvent, CivilCaseState> {
  CaseTypeRepo caseTypeRepo;

  CivilCaseBloc({this.caseTypeRepo}) : super(CivilCaseInitial());

  @override
  Stream<CivilCaseState> mapEventToState(
    CivilCaseEvent event,
  ) async* {
    if (event is GetCivilCases) {
      print("GetCivilCases Called");
      yield CivilCaseInitial();
      final res = await caseTypeRepo.getCivilCases();
      if (res != null) {
        yield CivilCaseLoaded(civilCasesRes: res);
      } else {
        yield CivilCaseError();
      }
    }
  }
}
