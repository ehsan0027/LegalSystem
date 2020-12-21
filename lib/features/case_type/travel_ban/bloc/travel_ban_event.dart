part of 'travel_ban_bloc.dart';

abstract class TravelBanEvent extends Equatable {
  const TravelBanEvent();
}
class GetTravelBanCases extends TravelBanEvent{
  @override
  List<Object> get props => [];

}
