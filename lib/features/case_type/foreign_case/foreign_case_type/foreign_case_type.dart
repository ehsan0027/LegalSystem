import 'package:flutter/material.dart';
import 'package:legal_system/model/foreign_case_res.dart';
import 'package:legal_system/model/foreign_typed_case_res.dart';
import 'package:legal_system/repository/firm_foreign_case_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/widgets.dart';
class ForeignCaseTypes extends StatefulWidget {

  final String fId;
  ForeignCaseTypes({this.fId});
  @override
  _ForeignCaseTypesState createState() => _ForeignCaseTypesState();
}

class _ForeignCaseTypesState extends State<ForeignCaseTypes> {


  FirmForeignCaseRepo _firmForeignCaseRepo;
  Future _foreignCases;



  @override
  void initState() {

    _firmForeignCaseRepo=FirmForeignCaseRepoImpl();
    _foreignCases=_firmForeignCaseRepo.getForeignTypeCases(widget.fId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cases"),
      ),

      body: FutureBuilder<ForeignTypedCaseRes>(
        future: _foreignCases,
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              final res=snapshot.data.data;
              return ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text("Civil Cases"),
                      subtitle: Text("Cases: ${res.civilCases}"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: MyAppColor.myPrimaryColor,
                      ),
                      onTap: () {
                        String fId=res.firmId.toString();
                        GV.case_type="civil";
                        int length=res.civilCases;
                        if(length == 0) {
                          print("No case found");
                        }else {
                          Navigator.of(context).pushNamed(
                              '/foreignCases', arguments: fId);
                        }
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Criminal Cases"),
                      subtitle: Text("Cases: ${res.criminalCases}"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: MyAppColor.myPrimaryColor,
                      ),
                      onTap: () {
                        GV.case_type="criminal";
                        String fId=res.firmId.toString();
                        int length=res.criminalCases;
                        if(length == 0) {
                          print("No case found");
                        }else {
                          Navigator.of(context).pushNamed('/foreignCases',arguments: fId);

                        }
                      },
                    ),
                  ),
                ],
              );
            }
          else if(snapshot.hasError){
            MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }
}
