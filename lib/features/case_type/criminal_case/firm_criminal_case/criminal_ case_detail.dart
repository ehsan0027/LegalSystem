import 'package:flutter/material.dart';
import 'package:legal_system/model/criminal_case_details.dart';
import 'package:legal_system/repository/firm_criminal_case_repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class CriminalCaseDetails extends StatefulWidget {
  final String caseId;

  CriminalCaseDetails({this.caseId});

  @override
  _CriminalCaseDetailsState createState() => _CriminalCaseDetailsState();
}

class _CriminalCaseDetailsState extends State<CriminalCaseDetails> {
  FirmCriminalCaseRepo _firmCriminalCaseRepo;
  Future _criminalCaseDetails;
  @override
  void initState() {
    print("Case Id ${widget.caseId}");
    _firmCriminalCaseRepo = FirmCriminalCaseRepoImpl();
    _criminalCaseDetails =
        _firmCriminalCaseRepo.getCriminalCaseDetail(widget.caseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Detail"),
      ),
      body: FutureBuilder<CriminalCaseDetailRes>(
        future: _criminalCaseDetails,
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

  Widget _buildLoadedProceedingCaseDetail(CriminalCaseDetailRes res) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Civil Case
              Container(
                child: Text(
                  "Criminal Case",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.caseName}",
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

              //Criminal Case No
              Container(
                child: Text(
                  "Criminal Case No",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.criminalCaseNo}",
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

              //Emirates
              Container(
                child: Text(
                  "Emirates",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.emirates}",
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

              //Police Station
              Container(
                child: Text(
                  "Police Station",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.policeStation}",
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

              //Date of Filing
              Container(
                child: Text(
                  "Date of Filing",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.fillingDate}",
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

              //Customer Name
              Container(
                child: Text(
                  "Customer Name",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.customerName}",
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

              //Cheque No
              Container(
                child: Text(
                  "Cheque No",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.chequeNo}",
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

              //Cheque Date
              Container(
                child: Text(
                  "Cheque Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.chequeDate}",
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

              //Cheque Amount
              Container(
                child: Text(
                  "Cheque Amount",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.chequeAmount}",
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

              //Drawer Bank
              Container(
                child: Text(
                  "Drawer Bank",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.drawerBank}",
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

              //Cheque Status
              Container(
                child: Text(
                  "Cheque Status",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.chequeStatus}",
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

              //Court Name
              Container(
                child: Text(
                  "Court Name",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.courtName}",
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

              //Next Hearing Date
              Container(
                child: Text(
                  "Next Hearing Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.nextHearingDate}",
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

              //Hearing Status
              Container(
                child: Text(
                  "Hearing Status",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.hearingStatus}",
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

              //Criminal Process
              Container(
                child: Text(
                  "Criminal Process",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.criminalProcess}",
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

              //Criminal Case Status
              Container(
                child: Text(
                  "Criminal Case Status",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.criminalCaseStatus}",
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

              //Reminder Date
              Container(
                child: Text(
                  "Reminder Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.hearingReminderDate}",
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

              //Remarks
              Container(
                child: Text(
                  "Remarks",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.remarks}",
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

              //Judgement Date
              Container(
                child: Text(
                  "Judgement Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.judgementDate}",
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

              //Judgement Remarks
              Container(
                child: Text(
                  "Judgement Remarks",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.judgementRemarks}",
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

              //Appeal Date
              Container(
                child: Text(
                  "Appeal Date",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.appealDate}",
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

              //Appeal Remarks
              Container(
                child: Text(
                  "Appeal Remarks",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.appealRemarks}",
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
