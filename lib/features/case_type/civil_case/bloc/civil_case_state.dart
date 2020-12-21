part of 'civil_case_bloc.dart';

abstract class CivilCaseState extends Equatable {
  const CivilCaseState();
}

class CivilCaseInitial extends CivilCaseState {
  @override
  List<Object> get props => [];
}
class CivilCaseLoaded extends CivilCaseState {
  CivilCasesRes civilCasesRes;
  CivilCaseLoaded({this.civilCasesRes});
  @override
  List<Object> get props => [civilCasesRes];
}
class CivilCaseError extends CivilCaseState {
  @override
  List<Object> get props => [];
}
