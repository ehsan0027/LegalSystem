import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/model/case_model.dart';
import 'package:legal_system/model/civil_case_res.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
import 'bloc/law_firm_bloc.dart';

class LawFirmHome extends StatefulWidget {
  @override
  _LawFirmHomeState createState() => _LawFirmHomeState();
}

class _LawFirmHomeState extends State<LawFirmHome> {
  LawFirmBloc _lawFirmBloc;

  @override
  void initState() {
    _lawFirmBloc = BlocProvider.of<LawFirmBloc>(context);
    _lawFirmBloc.add(GetLawFirms());

  }

  @override
  void dispose() {
    print("Dispose called");
    _lawFirmBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<LawFirmBloc, LawFirmState>(
        listener: (context, state) {
          if (state is LawFirmLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<LawFirmBloc, LawFirmState>(
          builder: (context, state) {
            if (state is LawFirmInitial) {
              return MyWidget.buildInitial();
            } else if (state is LawFirmLoaded) {
              return _buildLoadedLawFirms(state.lawFirmRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedLawFirms(LawFirmRes res) {
    final data = res.lawFirms;
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
                    'assets/images/court.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].firmName}"),
                  subtitle: Text("Total cases: ${data[index].totalCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/lawFirmDetail',arguments:data[index]);
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
