part of 'auction_bloc.dart';

abstract class AuctionState extends Equatable {
  const AuctionState();
}

class AuctionInitial extends AuctionState {
  @override
  List<Object> get props => [];
}
class AuctionLoaded extends AuctionState {
  AuctionRes auctionRes;
  AuctionLoaded({this.auctionRes});
  @override
  List<Object> get props => [auctionRes];
}
class AuctionError extends AuctionState {
  @override
  List<Object> get props => [];
}
