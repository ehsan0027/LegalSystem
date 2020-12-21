import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/foreign_case/bloc/foreign_case_bloc.dart';
import 'package:legal_system/features/case_type/travel_ban/bloc/travel_ban_bloc.dart';
import 'package:legal_system/model/travel_ban_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class TravelBanHome extends StatefulWidget {
  @override
  _TravelBanHomeState createState() => _TravelBanHomeState();
}

class _TravelBanHomeState extends State<TravelBanHome> {


  TravelBanBloc _travelBanBloc;

  @override
  void initState() {
    _travelBanBloc = BlocProvider.of<TravelBanBloc>(context);
    _travelBanBloc.add(GetTravelBanCases());
  }

  @override
  void dispose() {
    print("Dispose called");
    _travelBanBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<TravelBanBloc, TravelBanState>(
        listener: (context, state) {
          if (state is TravelBanLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<TravelBanBloc, TravelBanState>(
          builder: (context, state) {
            if (state is TravelBanInitial) {
              return MyWidget.buildInitial();
            } else if (state is TravelBanLoaded) {
              return _buildLoadedTravelBanCase(state.travelBanRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedTravelBanCase(TravelBanRes res) {
    final data = res.travelBanCases;

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
                    'assets/images/airplane.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].lawFirm}"),
                  subtitle: Text("Travel Ban: ${data[index].travelBanCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    String firmId=data[index].id.toString();
                    Navigator.of(context).pushNamed('/travelBanCase',arguments: firmId);
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
