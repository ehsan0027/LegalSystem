part of 'foreign_case_bloc.dart';

abstract class ForeignCaseState extends Equatable {
  const ForeignCaseState();
}

class ForeignCaseInitial extends ForeignCaseState {
  @override
  List<Object> get props => [];
}
class ForeignCaseLoaded extends ForeignCaseState {
  ForeignCasesRes foreignCasesRes;
  ForeignCaseLoaded({this.foreignCasesRes});
  @override
  List<Object> get props => [foreignCasesRes];
}
class ForeignCaseError extends ForeignCaseState {
  @override
  List<Object> get props => [];
}
