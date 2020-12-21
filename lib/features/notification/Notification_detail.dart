import 'package:flutter/material.dart';
import 'package:legal_system/model/notification/notification_details_res.dart';
import 'package:legal_system/repository/notification_repository.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class NotificationDetails extends StatefulWidget {
  String path;

  NotificationDetails({this.path});

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  Future<NotificationDetailRes> _notification;

  @override
  void initState() {
    NotificationRepo notificationRepo;
    notificationRepo = NotificationRepoImpl();
    _notification = notificationRepo.getNotificationDetail(widget.path);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification Detail"),
      ),
      body: FutureBuilder<NotificationDetailRes>(
        future: _notification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _builNotificationDetail(snapshot.data);
          }
          if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }

  Widget _builNotificationDetail(NotificationDetailRes res) {
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
                  "${res.data.name}",
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
                  "${res.data.email}",
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
                  "${res.data.phone}",
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
                  "${res.data.passport}",
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
                  "${res.data.dateOfBirth}",
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
                  "${res.data.company}",
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
                  "${res.data.nationality}",
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
                  "${res.data.memo}",
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
                  "${res.data.address}",
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
                  "${res.data.legalHeadRemarks}",
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

              //Status
              Container(
                child: Text(
                  "Status",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "${res.data.status}",
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
