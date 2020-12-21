part of 'auction_bloc.dart';

abstract class AuctionEvent extends Equatable {
  const AuctionEvent();
}
class GetAuctionCases extends AuctionEvent{
  @override
  List<Object> get props =>[];
}
