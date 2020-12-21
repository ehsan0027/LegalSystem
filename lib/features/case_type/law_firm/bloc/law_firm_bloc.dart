import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/civil_case_res.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'law_firm_event.dart';

part 'law_firm_state.dart';

class LawFirmBloc extends Bloc<LawFirmEvent, LawFirmState> {
  CaseTypeRepo caseTypeRepo;
  LawFirmBloc({this.caseTypeRepo}) : super(LawFirmInitial());
  @override
  Stream<LawFirmState> mapEventToState(
    LawFirmEvent event,
  ) async* {
    // if (event is GetCivilCases) {
    //   yield LawFirmInitial();
    //   final  res = await caseTypeRepo.getCivilCases();
    //     if (res != null) {
    //       print("Civil Cases ${res.civilCases[0].civilCases}");
    //       yield LawFirmLoaded.civilCase(civilCasesRes: res);
    //     } else {
    //       yield LawFirmError();
    //     }
    //   }
     if (event is GetLawFirms) {
      final  res = await caseTypeRepo.getLawFirms();
        if (res != null) {
          yield LawFirmLoaded(lawFirmRes: res);
        } else {
          yield LawFirmError();
        }

      }

  }
}
