import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/model/firm_case_res.dart';
import 'package:legal_system/model/firm_civil_case.dart';
import 'package:legal_system/repository/firm_civil_case_repository.dart';
import 'package:legal_system/repository/firm_criminal_case_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/widgets.dart';
class FirmCriminalCases extends StatefulWidget {
 final String firmId;
  FirmCriminalCases({this.firmId});
  @override
  _FirmCriminalCasesState createState() => _FirmCriminalCasesState();
}

class _FirmCriminalCasesState extends State<FirmCriminalCases> {
  FirmCriminalCaseRepo _firmCriminalCaseRepo;
  Future firmCivilCases;
  @override
  void initState() {
    _firmCriminalCaseRepo=FirmCriminalCaseRepoImpl();
   firmCivilCases= _firmCriminalCaseRepo.getFirmCriminalCase(widget.firmId);
  }
  @override
  void dispose() {
    print("Dispose called");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Criminal Cases"),
      ),
      body:FutureBuilder<FirmCaseRes>(
        future: firmCivilCases,
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              final res=snapshot.data;
              return _buildLoadedFirmCivilCase(res);
            }else if(snapshot.hasError){
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedFirmCivilCase(FirmCaseRes res) {
    final data = res.data;

    if (data == null) {
      return MyWidget.buildError();
    }

    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text("Court Proceeding"),
            subtitle: Text("Cases: ${data.courtProceedings}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {
              GV.case_type = "criminal";
              Navigator.of(context).pushNamed('/civilCourtProceeding',arguments: data.firmId);
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Expert Opinion"),
            subtitle: Text("Cases: ${data.expertOpinion}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {
              GV.case_type = "criminal";
              String id=data.firmId;
              Navigator.of(context).pushNamed('/civilExpertOpinion',arguments: id);
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Judgement"),
            subtitle: Text("Cases: ${data.judgement}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {
              GV.case_type = "criminal";
              String id=data.firmId.toString();
              Navigator.of(context).pushNamed('/civilJudgement',arguments: id);
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Execution"),
            subtitle: Text("Cases: ${data.execution}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {
              String id=data.firmId.toString();
              GV.case_type = "criminal";
              Navigator.of(context).pushNamed('/civilExecution',arguments: id);
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Auction"),
            subtitle: Text("Cases: ${data.auction}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {
              String id=data.firmId.toString();
              GV.case_type = "criminal";
              Navigator.of(context).pushNamed('/civilAuction',arguments: id);
            },
          ),
        ),
      ],
    );
  }


}
