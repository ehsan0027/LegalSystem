import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/foreign_case_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'foreign_case_event.dart';
part 'foreign_case_state.dart';

class ForeignCaseBloc extends Bloc<ForeignCaseEvent, ForeignCaseState> {
  CaseTypeRepo caseTypeRepo;
  ForeignCaseBloc({this.caseTypeRepo}) : super(ForeignCaseInitial());

  @override
  Stream<ForeignCaseState> mapEventToState(
    ForeignCaseEvent event,
  ) async* {
    if(event is GetForeignCase){
      final res = await caseTypeRepo.getForeignCases();
      if (res != null) {
        yield ForeignCaseLoaded(foreignCasesRes: res);
      } else {
        yield ForeignCaseError();
      }

    }
  }
}
