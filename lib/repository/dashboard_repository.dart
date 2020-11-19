import 'package:legal_system/model/dashboard_res.dart';
import 'package:http/http.dart' as http;
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';
import 'dart:async';
import 'dart:io';
abstract class DashboardRepo{
  Future<DashboardRes> getDashboardData();
}
class DashboardRepoImpl extends DashboardRepo{
  DashboardRes _dashboardRes;
  @override
  Future<DashboardRes> getDashboardData() async{
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('dashboard started.........');
      var response = await http.get('${Const.BASE_URL}/admin/dashboard',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
     ).timeout(Duration(seconds: timeout));
      print('dashboard ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        _dashboardRes = dashboardResFromJson(responseBody);
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
    return _dashboardRes;

  }
}