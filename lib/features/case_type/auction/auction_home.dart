import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/model/auction_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

import 'bloc/auction_bloc.dart';
import 'bloc/auction_bloc.dart';
import 'bloc/auction_bloc.dart';

class AuctionHome extends StatefulWidget {
  @override
  _AuctionHomeState createState() => _AuctionHomeState();
}

class _AuctionHomeState extends State<AuctionHome> {

  AuctionBloc _auctionBloc;

  @override
  void initState() {
    _auctionBloc = BlocProvider.of<AuctionBloc>(context);
    _auctionBloc.add(GetAuctionCases());
  }

  @override
  void dispose() {
    print("Dispose called");
    _auctionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<AuctionBloc, AuctionState>(
        listener: (context, state) {
          if (state is AuctionLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<AuctionBloc, AuctionState>(
          builder: (context, state) {
            if (state is AuctionInitial) {
              return MyWidget.buildInitial();
            } else if (state is AuctionLoaded) {
              return _buildLoadedAuctionCase(state.auctionRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedAuctionCase(AuctionRes res) {
    final data = res.auctions;

    if (data.isEmpty) {
      return MyWidget.buildError();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/auction.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].firmName}"),
                  subtitle: Text("Auction Cases: ${data[index].cases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed('/caseDetail');
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }

}
