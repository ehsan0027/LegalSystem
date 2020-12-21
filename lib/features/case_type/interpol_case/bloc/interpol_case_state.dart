part of 'interpol_case_bloc.dart';

abstract class InterpolCaseState extends Equatable {
  const InterpolCaseState();
}

class InterpolCaseInitial extends InterpolCaseState {
  @override
  List<Object> get props => [];
}
class InterpolCaseLoaded extends InterpolCaseState {
  InterpolCasesRes interpolCasesRes;
  InterpolCaseLoaded({this.interpolCasesRes});
  @override
  List<Object> get props => [interpolCasesRes];
}
class InterpolCaseError extends InterpolCaseState {
  @override
  List<Object> get props => [];
}
