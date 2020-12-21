import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/criminal_case_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'criminal_case_event.dart';
part 'criminal_case_state.dart';

class CriminalCaseBloc extends Bloc<CriminalCaseEvent, CriminalCaseState> {

  CaseTypeRepo caseTypeRepo;

  CriminalCaseBloc({this.caseTypeRepo}) : super(CriminalCaseInitial());

  @override
  Stream<CriminalCaseState> mapEventToState(
    CriminalCaseEvent event,
  ) async* {

    if(event is GetCriminlCase)
      {
        yield CriminalCaseInitial();
        final res = await caseTypeRepo.getCriminalCases();
        if (res != null) {
          yield CriminalCaseLoaded(criminalCasesRes: res);
        } else {
          yield CriminalCaseError();
        }


      }
  }
}
