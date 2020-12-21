import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:legal_system/model/auction_res.dart';
import 'package:legal_system/repository/case_type_repository.dart';

part 'auction_event.dart';
part 'auction_state.dart';

class AuctionBloc extends Bloc<AuctionEvent, AuctionState> {
  CaseTypeRepo caseTypeRepo;
  AuctionBloc({this.caseTypeRepo}) : super(AuctionInitial());

  @override
  Stream<AuctionState> mapEventToState(
    AuctionEvent event,
  ) async* {

    if(event is GetAuctionCases) {
      final res = await caseTypeRepo.getAuctionCases();
      if (res != null) {
        yield AuctionLoaded(auctionRes: res);
      } else {
        yield AuctionError();
      }
    }
  }
}
