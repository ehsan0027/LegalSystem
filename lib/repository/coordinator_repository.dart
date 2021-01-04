import 'package:legal_system/model/coordinator/coordinator_request_res.dart';
import 'package:legal_system/model/coordinator/coordinator_view_request.dart';
import 'package:legal_system/model/notification/submit_request_res.dart';
import 'package:legal_system/utils/gv.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:legal_system/utils/stringsData.dart';

abstract class CoordinatorRepo{

  Future<CoordinatorRequestsRes> getCoordinatorReq();
  Future<CoordinatorViewRequestsRes> getRequestDetail(String id);
  Future<SubmitRequestRes> submitRequest(String remarks,String status,String id);
}
class CoordinatorRepoImpl extends CoordinatorRepo{
  @override
  Future<CoordinatorRequestsRes> getCoordinatorReq() async{
    CoordinatorRequestsRes coordinatorRequestsRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('coordinator getting request started.........');
      var response = await http.get('${Const.BASE_URL}/coordinator/requests',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('coordinator getting request ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        coordinatorRequestsRes = coordinatorRequestsResFromJson(responseBody);
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
    return coordinatorRequestsRes;


  }

  @override
  Future<CoordinatorViewRequestsRes> getRequestDetail(String id) async{
    CoordinatorViewRequestsRes coordinatorViewRequestsRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('coordinator getting request started.........');
      var response = await http.get('${Const.BASE_URL}/coordinator/request/$id',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('coordinator getting request ended.........');
      if (response.statusCode == 200) {
        print("Success...${response.statusCode}");

        final responseBody = response.body;
        coordinatorViewRequestsRes = coordinatorViewRequestsResFromJson(responseBody);
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
    return coordinatorViewRequestsRes;
  }

  @override
  Future<SubmitRequestRes> submitRequest(String remarks, String status,String id)async {
    SubmitRequestRes submitRequestRes;
    int timeout = 5;
    try {
      print('auth started.........');
      var response = await http.post('${Const.BASE_URL}/coordinator/request/action/$id', body: {
        "remarks": remarks,
        "accept": status,
      }).timeout(Duration(seconds: timeout));
      print('auth ended.........');

      if (response.statusCode == 200) {
        final responseBody = response.body;
        submitRequestRes = submitRequestResFromJson(responseBody);
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
    print("submitRequestRes Res $submitRequestRes");
    return submitRequestRes;

  }

}