part of 'case_type_bloc.dart';

abstract class CaseTypeState extends Equatable {
  const CaseTypeState();
}

class CaseTypeInitial extends CaseTypeState {
  @override
  List<Object> get props => [];
}
class CaseTypeLoaded extends CaseTypeState {

  LawFirmRes lawFirmRes;
  CaseTypeLoaded.lawFirm({this.lawFirmRes});

  @override
  List<Object> get props => [];
}
class CaseTypeError extends CaseTypeState {
  @override
  List<Object> get props => [];
}
