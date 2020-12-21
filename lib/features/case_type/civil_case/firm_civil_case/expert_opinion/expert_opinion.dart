import 'package:flutter/material.dart';
import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/repository/firm_civil_case_repository.dart';
import 'package:legal_system/repository/firm_criminal_case_repository.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class ExpertOpinion extends StatefulWidget {
  String firmId;

  ExpertOpinion({this.firmId});

  @override
  _ExpertOpinionState createState() => _ExpertOpinionState();
}

class _ExpertOpinionState extends State<ExpertOpinion> {
  FirmCivilCaseRepo _firmCivilCaseRepo;
  FirmCriminalCaseRepo _firmCriminalCaseRepo;
  Future _expertOpinion;

  @override
  void initState() {
    if (GV.case_type == "civil") {
      _firmCivilCaseRepo = FirmCivilCaseRepoImpl();
      _expertOpinion = _firmCivilCaseRepo.getExpertOpinionCases(widget.firmId);
    } else if (GV.case_type == "criminal") {
      _firmCriminalCaseRepo = FirmCriminalCaseRepoImpl();
      _expertOpinion =
          _firmCriminalCaseRepo.getExpertOpinionCases(widget.firmId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expert Opinion"),
      ),
      body: FutureBuilder<CaseRes>(
        future: _expertOpinion,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final res = snapshot.data;
            return _buildLoadedFirmCivilCase(res);
          } else if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedFirmCivilCase(CaseRes res) {
    final data = res.data;
    var mono = TextStyle(fontFamily: 'monospace');

    if (data.isEmpty) {
      return MyWidget.buildError();
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: ListTile(
              title:Text("${data[index].customerName}",style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
              ),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Case NO# ",),
                          Text("Court Name "),
                          Text("Phone"),
                          Text("Nationality",),
                          Text("Passport No",),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal*12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${data[index].caseNo}"),
                              Text("${data[index].courtName}"),
                              Text("${data[index].phone}"),
                              Text("${data[index].nationality}"),
                              Text("${data[index].passport}"),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
              onTap: () {
                String caseId = data[index].caseId.toString();


                if (GV.case_type == "civil") {
                  Navigator.of(context).pushNamed(
                      '/firmCivilCaseDetails',
                      arguments: caseId);
                } else if (GV.case_type == "criminal") {
                  Navigator.of(context)
                      .pushNamed('/firmCriminalCaseDetails', arguments: caseId);
                }

              },
            ),
          ),
        );
      },
    );


  }
}
