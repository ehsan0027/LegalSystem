part of 'law_firm_bloc.dart';

abstract class LawFirmEvent extends Equatable {
  const LawFirmEvent();
}

class GetLawFirms extends LawFirmEvent{

  @override
  List<Object> get props => [];

}
class GetCivilCases extends LawFirmEvent{
  @override
  List<Object> get props => [];

}
