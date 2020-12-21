import 'package:flutter/material.dart';
import 'package:legal_system/model/notification/notification_res.dart';
import 'package:legal_system/repository/notification_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<NotificationRes> _notification;

  @override
  void initState() {
    NotificationRepo notificationRepo;
    notificationRepo = NotificationRepoImpl();
    _notification = notificationRepo.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification"),
      ),
      body: FutureBuilder<NotificationRes>(
        future: _notification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var notificationList = snapshot.data.notifications;

            if (notificationList.isEmpty) {
              return MyWidget.buildError();
            }

            return ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      width: SizeConfig.blockSizeHorizontal * 10,
                      height: SizeConfig.blockSizeHorizontal * 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '${notificationList[index].userImage}'),
                        ),
                      ),
                    ),
                    title: Text("${notificationList[index].userName}"),
                    subtitle:
                        Text("${notificationList[index].notificationMessage}"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: MyAppColor.myPrimaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/notificationDetails',
                          arguments: notificationList[index].path);
                    },
                  ),
                );
              },
            );
          }
          if (snapshot.hasError) {
            return MyWidget.buildError();
          }
          return MyWidget.buildInitial();
        },
      ),
    );
  }
}
