import 'package:flutter/material.dart';
import 'package:legal_system/model/travelban_case-detail.dart';
import 'package:legal_system/repository/firm_travelban_case-repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class TravelBanCaseDetail extends StatefulWidget {
  final String caseId;
  TravelBanCaseDetail({this.caseId});

  @override
  _TravelBanCaseDetailState createState() => _TravelBanCaseDetailState();
}

class _TravelBanCaseDetailState extends State<TravelBanCaseDetail> {


  FirmTravelBanCaseRepo _firmTravelBanCaseRepo;
  Future _travelBanCaseDetails;
  @override
  void initState() {
    print("Case Id ${widget.caseId}");
    _firmTravelBanCaseRepo=FirmTrvelBanCaseRepoImpl();
    _travelBanCaseDetails=_firmTravelBanCaseRepo.getTravelBanCasesDetail(widget.caseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Detail"),
      ),
      body: FutureBuilder<TravelBanCaseDetailRes>(
        future: _travelBanCaseDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final res = snapshot.data;
            return _buildLoadedInterpolCaseDetail(res);
          } else if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedInterpolCaseDetail(TravelBanCaseDetailRes res) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //TRAVEL BAN
              Container(
                child: Text(
                  "TRAVEL BAN",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),


               //law firm
              Container(
                child: Text(
                  "Law Firm",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.lawFirm}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),

              //travel_ban_no
              Container(
                child: Text(
                  "Travel Ban No",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.travelBanNo}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),

              //travel_ban_filling_no
              Container(
                child: Text(
                  "Travel Ban Filling No",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.travelBanFillingNo}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),

              //travel_ban_filling_date
              Container(
                child: Text(
                  "Travel Ban Filling Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.travelBanFillingDate}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),

              //travel_ban_expiry_date
              Container(
                child: Text(
                  "Travel Ban Expiry Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.travelBanExpiryDate}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),

              //travel_ban_expiry_reminder
              Container(
                child: Text(
                  "Travel Ban Expiry Reminder",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.travelBanExpiryReminder}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              Divider(
                height: 10,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),


            ],
          ),
        )
      ],
    );
  }



}
