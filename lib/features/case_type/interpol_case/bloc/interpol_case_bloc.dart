import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/interpol_case_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'interpol_case_event.dart';
part 'interpol_case_state.dart';

class InterpolCaseBloc extends Bloc<InterpolCaseEvent, InterpolCaseState> {
  CaseTypeRepo caseTypeRepo;
  InterpolCaseBloc({this.caseTypeRepo}) : super(InterpolCaseInitial());

  @override
  Stream<InterpolCaseState> mapEventToState(
    InterpolCaseEvent event,
  ) async* {
    if(event is GetInterpolCase){
      final res = await caseTypeRepo.getInterpolCases();
      if (res != null) {
        yield InterpolCaseLoaded(interpolCasesRes: res);
      } else {
        yield InterpolCaseError();
      }
    }
  }
}
