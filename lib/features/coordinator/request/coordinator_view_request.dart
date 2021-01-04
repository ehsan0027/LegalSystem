import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legal_system/model/coordinator/coordinator_view_request.dart';
import 'package:legal_system/repository/coordinator_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class CoordinatorViewReq extends StatefulWidget {
  final String id;

  CoordinatorViewReq({this.id});

  @override
  _CoordinatorViewReqState createState() => _CoordinatorViewReqState();
}

class _CoordinatorViewReqState extends State<CoordinatorViewReq> {
  Future<CoordinatorViewRequestsRes> getRequestDetail;
  CoordinatorViewRequestsRes _res;
  CoordinatorRepo _coordinatorRepo;
  final TextEditingController _remarksCTL = TextEditingController();

  @override
  void initState() {
    print("Request Id ${widget.id}");
    _coordinatorRepo = CoordinatorRepoImpl();
    getRequestDetail = _coordinatorRepo.getRequestDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Request Detail"),
      ),
      body: FutureBuilder<CoordinatorViewRequestsRes>(
        future: getRequestDetail,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            _res = snapshot.data;
            return buildViewDetail();
          } else if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget buildViewDetail() {
    int status = _res.data.status;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name
              Container(
                child: Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.name}",
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

              //Email
              Container(
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.email}",
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

              //phone
              Container(
                child: Text(
                  "Phone #",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.phone}",
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

              //Passport
              Container(
                child: Text(
                  "Passport",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.passport}",
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

              //dateOfBirth
              Container(
                child: Text(
                  "Date of birth",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.dateOfBirth}",
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

              //Company
              Container(
                child: Text(
                  "Company",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.company}",
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

              //Nationality
              Container(
                child: Text(
                  "Nationality",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.nationality}",
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

              //transferMemo
              Container(
                child: Text(
                  "Transfer Memo",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.memo}",
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

              //Address
              Container(
                child: Text(
                  "Address",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.address}",
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

              //remarks
              Container(
                child: Text(
                  "Remarks",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${_res.data.legalHeadRemarks}",
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

              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
            ],
          ),
        ),
        status == 0 ? pendingView() : Container()
      ],
    );
  }

  Widget pendingView() {
    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: SizeConfig.blockSizeVertical * 20,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                controller: _remarksCTL,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: MyAppColor.myPrimaryColorDark,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Add your remarks here..."),
              )),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  // width: SizeConfig.screenWidth,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red,
                    child: Padding(
                      padding:
                      EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                      child: Text(
                        "REJECT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      String remarks = _remarksCTL.text.toString();
                      if (remarks.isEmpty)
                        {
                        }else{
                        String id=_res.data.requestId.toString();
                        _coordinatorRepo.submitRequest(remarks, '0', id);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeVertical,
              ),
              Expanded(
                child: Container(
                  // width: SizeConfig.screenWidth,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: MyAppColor.myPrimaryColor)),
                    color: MyAppColor.myPrimaryColor,
                    child: Padding(
                      padding:
                      EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                      child: Text(
                        "ACCEPT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      String remarks = _remarksCTL.text.toString();
                      if (remarks.isEmpty)
                      {
                      }else{
                        String id=_res.data.requestId.toString();
                        _coordinatorRepo.submitRequest(remarks, '1', id);
                      }
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
