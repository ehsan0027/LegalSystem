import 'package:flutter/material.dart';
import 'package:legal_system/model/interpol_case_detail_res.dart';
import 'package:legal_system/repository/firm_interpol_case_repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class InterpolCaseDetail extends StatefulWidget{
  final String caseId;
  InterpolCaseDetail({this.caseId});
  @override
  _InterpolCaseDetailState createState() => _InterpolCaseDetailState();
}

class _InterpolCaseDetailState extends State<InterpolCaseDetail> {
  FirmInterpolCaseRepo _firmInterpolCaseRepo;
  Future _interpolCaseDetails;
  @override
  void initState() {
    print("Case Id ${widget.caseId}");
    _firmInterpolCaseRepo = FirmInterpolCaseRepoImpl();
   _interpolCaseDetails=_firmInterpolCaseRepo.getInterpolCaseDetail(widget.caseId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case Detail"),
      ),
      body: FutureBuilder<InterpolCaseDetailRes>(
        future: _interpolCaseDetails,
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

  Widget _buildLoadedInterpolCaseDetail(InterpolCaseDetailRes res) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

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
                  "${res.data.dateOfFilling}",
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


            ],
          ),
        )
      ],
    );
  }

}















