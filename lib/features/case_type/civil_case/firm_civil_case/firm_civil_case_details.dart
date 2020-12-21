import 'package:flutter/material.dart';
import 'package:legal_system/model/civil_case_details_res.dart';
import 'package:legal_system/repository/firm_civil_case_repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class CivilCaseDetail extends StatefulWidget {
 final String caseId;
  CivilCaseDetail({this.caseId});
  @override
  _CivilCaseDetailState createState() => _CivilCaseDetailState();
}

class _CivilCaseDetailState extends State<CivilCaseDetail> {
  FirmCivilCaseRepo _firmCivilCaseRepo;
  Future _civilCourtProceedingDetail;
  @override
  void initState() {
    print("Case Id ${widget.caseId}");
    _firmCivilCaseRepo=FirmCivilCaseRepoImpl();
    _civilCourtProceedingDetail=_firmCivilCaseRepo.getCivilCaseDetail(widget.caseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Detail"),
      ),
      body:FutureBuilder<CivilCaseDetailRes>(
        future: _civilCourtProceedingDetail,
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            final res=snapshot.data;
            return _buildLoadedProceedingCaseDetail(res);
          }else if(snapshot.hasError){
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _buildLoadedProceedingCaseDetail(CivilCaseDetailRes res){

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal*5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Civil Case
              Container(
                child: Text("Case",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.caseName}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              //Law Firm
              Container(
                child: Text("Law Firm",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.lawFirm}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              //Court Name
              Container(
                child: Text("Court Name",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.courtName}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Case No
              Container(
                child: Text("Case No #",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.caseNo}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Case Type
              Container(
                child: Text("Case Type",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.caseType}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Gauranter Name
              Container(
                child: Text("Gauranter Name",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.guarantorName}",style: TextStyle(
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
                child: Text("${res.data.visaIssuedDate}",style: TextStyle(
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

              //Travel Ban
              Container(
                child: Text("Travel Ban",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.travelBan}",style: TextStyle(
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
                child: Text("${res.data.nextHearingDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),


              //Next Hearing Date
              Container(
                child: Text("Hearing Reminder Date",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.hearingReminderDate}",style: TextStyle(
                  color: Colors.grey,
                ),),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical,),
              Divider(height: 10,),
              SizedBox(height: SizeConfig.blockSizeVertical,),

              //Reminder Message
              Container(
                child: Text("Reminder Message",style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Container(
                child: Text("${res.data.reminderMessage}",style: TextStyle(
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
