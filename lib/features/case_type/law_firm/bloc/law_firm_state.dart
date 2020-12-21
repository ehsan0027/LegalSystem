part of 'law_firm_bloc.dart';

abstract class LawFirmState extends Equatable {
  const LawFirmState();
}

class LawFirmInitial extends LawFirmState {
  @override
  List<Object> get props => [];
}
class LawFirmLoaded extends LawFirmState {

  LawFirmRes lawFirmRes;
  LawFirmLoaded({this.lawFirmRes});
  @override
  List<Object> get props => [lawFirmRes];
}
class LawFirmError extends LawFirmState {
  @override
  List<Object> get props => [];
}
