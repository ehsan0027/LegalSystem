part of 'case_type_bloc.dart';

abstract class CaseTypeEvent extends Equatable {
  const CaseTypeEvent();
}

class GetTypeCases extends CaseTypeEvent{
  @override
  List<Object> get props => [];

}
