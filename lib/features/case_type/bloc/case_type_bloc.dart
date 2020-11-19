import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'case_type_event.dart';

part 'case_type_state.dart';

class CaseTypeBloc extends Bloc<CaseTypeEvent, CaseTypeState> {
  CaseTypeRepo caseTypeRepo;

  CaseTypeBloc({this.caseTypeRepo}) : super(CaseTypeInitial());

  @override
  Stream<CaseTypeState> mapEventToState(
    CaseTypeEvent event,
  ) async* {
    if (event is GetTypeCases) {
      yield CaseTypeInitial();

      final res = await caseTypeRepo.getLawFirms();

      if (res != null) {
        yield CaseTypeLoaded.lawFirm(lawFirmRes: res);
      } else {
        yield CaseTypeError();
      }
    }
  }
}
