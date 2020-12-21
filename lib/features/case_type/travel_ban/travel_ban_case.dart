import 'package:flutter/material.dart';
import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/repository/firm_travelban_case-repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class TravelBanCase extends StatefulWidget {
  final String fId;
  TravelBanCase({this.fId});
  @override
  _TravelBanCaseState createState() => _TravelBanCaseState();
}

class _TravelBanCaseState extends State<TravelBanCase> {



  FirmTravelBanCaseRepo _firmTravelBanCaseRepo;
  Future _travelBan;
  @override
  void initState() {
    _firmTravelBanCaseRepo=FirmTrvelBanCaseRepoImpl();
    _travelBan=_firmTravelBanCaseRepo.getTravelBanCases(widget.fId);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cases"),
      ),
      body: FutureBuilder(
        future: _travelBan,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final res = snapshot.data;
            return _buildLoadedFirmTravelBanCase(res);
          } else if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedFirmTravelBanCase(CaseRes res) {
    final data = res.data;
    var mono = TextStyle(fontFamily: 'roboto');

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
              title: Text(
                "${data[index].customerName}",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
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
                          Text(
                            "Case NO# ",
                          ),
                          Text("Court Name "),
                          Text("Phone"),
                          Text(
                            "Nationality",
                          ),
                          Text(
                            "Passport No",
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 12),
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
                Navigator.of(context).pushNamed( '/travelBanCasesDetail',arguments: caseId);

              },
            ),
          ),
        );
      },
    );
  }



}
