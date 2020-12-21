part of 'criminal_case_bloc.dart';
abstract class CriminalCaseState extends Equatable {
  const CriminalCaseState();
}

class CriminalCaseInitial extends CriminalCaseState {
  @override
  List<Object> get props => [];
}
class CriminalCaseLoaded extends CriminalCaseState {

  CriminalCasesRes criminalCasesRes;
  CriminalCaseLoaded({this.criminalCasesRes});
  @override
  List<Object> get props => [criminalCasesRes];

}
class CriminalCaseError extends CriminalCaseState {
  @override
  List<Object> get props => [];
}