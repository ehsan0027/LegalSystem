import 'package:flutter/material.dart';
import 'package:legal_system/model/foreign_civil_case_detail_res.dart';
import 'package:legal_system/repository/firm_foreign_case_repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class ForeignCivilCaseDetail extends StatefulWidget {
  final String caseId;
  ForeignCivilCaseDetail({this.caseId});
  @override
  _ForeignCivilCaseDetailState createState() => _ForeignCivilCaseDetailState();
}

class _ForeignCivilCaseDetailState extends State<ForeignCivilCaseDetail> {

  FirmForeignCaseRepo _firmForeignCaseRepo;
  Future _foreignCivilCaseDetails;

  @override
  void initState() {
    print("Case Id ${widget.caseId}");
    _firmForeignCaseRepo = FirmForeignCaseRepoImpl();
    _foreignCivilCaseDetails=_firmForeignCaseRepo.getForeignCivilCaseDetail(widget.caseId) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Detail"),
      ),
      body: FutureBuilder<ForeignCivilCaseDetailRes>(
        future: _foreignCivilCaseDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final res = snapshot.data;
            return _buildLoadedProceedingCaseDetail(res);
          } else if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedProceedingCaseDetail(ForeignCivilCaseDetailRes res) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Phase
              Container(
                child: Text(
                  "Phase",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.phase}",
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

              //Law Firm
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

              //Case Number
              Container(
                child: Text(
                  "Case Number",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.caseNumber}",
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

              //Gauranter Name
              Container(
                child: Text(
                  "Gauranter Name",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.guarantorName}",
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

              //Passport No
              Container(
                child: Text("Passport No",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.passportNo}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Visa No
              Container(
                child: Text("Visa No",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.visaNo}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Visa Issued Date
              Container(
                child: Text("Visa Issued Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.visaIssueDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Visa Expiry Date
              Container(
                child: Text("Visa Expiry Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.visaExpiryDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Travel Ban Status
              Container(
                child: Text("Travel Ban Status",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.travelBanStatus}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Hearing Date
              Container(
                child: Text("Hearing Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.hearingDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Hearing Status
              Container(
                child: Text("Hearing Status",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.hearingStatus}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Next Hearing Date
              Container(
                child: Text("Next Hearing Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.nextHearing}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Next Hearing Date reminder
              Container(
                child: Text("Hearing Reminder Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.reminder}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Remarks
              Container(
                child: Text("Remarks",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.remarks}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Last Date to Appeal
              Container(
                child: Text("Last Date to Appeal",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.lastDateToAppeal}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Appeal Date
              Container(
                child: Text("Appeal Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.appealDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Appeal Remarks
              Container(
                child: Text("Appeal Remarks",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.appealRemarks}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Judgement Date
              Container(
                child: Text("Judgement Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.judgementDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Judgement Remarks
              Container(
                child: Text("Judgement Remarks",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.judgementRemarks}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Final Judgement
              Container(
                child: Text("Final Judgement",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.finalJudgement}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),




            ],
          ),
        )
      ],
    );
  }




}
