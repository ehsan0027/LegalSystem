import 'package:legal_system/model/notification/notification_details_res.dart';
import 'package:legal_system/model/notification/notification_res.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';

abstract class NotificationRepo {
  Future<NotificationRes> getNotifications();
  Future<NotificationDetailRes>getNotificationDetail(String path);

}

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<NotificationRes> getNotifications() async {
    NotificationRes notificationRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting notifications started.........');
      var response = await http.get(
        '${Const.BASE_URL}/notifications',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('notifications ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        notificationRes = notificationResFromJson(responseBody);
      } else {
        print("Something went wrong...${response.statusCode}");
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
    return notificationRes;
  }

  @override
  Future<NotificationDetailRes> getNotificationDetail(String path) async{
    NotificationDetailRes notificationRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print("Role :${ GV.USER_ROLE}");
      print('getting notifications started.........');
      var response = await http.get('$path',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('notifications ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        notificationRes = notificationDetailResFromJson(responseBody);
        print('200 \t${notificationRes.data.nationality}');
      } else {
        print("Something went wrong...${response.statusCode}");
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
    return notificationRes;

  }
}
