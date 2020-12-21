part of 'travel_ban_bloc.dart';

abstract class TravelBanState extends Equatable {
  const TravelBanState();
}

class TravelBanInitial extends TravelBanState {
  @override
  List<Object> get props => [];
}
class TravelBanLoaded extends TravelBanState {
  TravelBanRes travelBanRes;
  TravelBanLoaded({this.travelBanRes});
  @override
  List<Object> get props => [travelBanRes];
}
class TravelBanError extends TravelBanState {
  @override
  List<Object> get props => [];
}
