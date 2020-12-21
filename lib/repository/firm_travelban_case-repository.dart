import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/model/travelban_case-detail.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:legal_system/utils/stringsData.dart';
abstract class FirmTravelBanCaseRepo{
  Future<CaseRes> getTravelBanCases(String fId);
  Future<TravelBanCaseDetailRes> getTravelBanCasesDetail(String cId);
}
class FirmTrvelBanCaseRepoImpl extends FirmTravelBanCaseRepo{
  @override
  Future<CaseRes> getTravelBanCases(String fId) async{

    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting travel-ban started.........');
      var response = await http.get('${Const.BASE_URL}/admin/travel-ban/$fId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('travel-ban ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        caseRes = caseResFromJson(responseBody);
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
    return caseRes;

  }

  @override
  Future<TravelBanCaseDetailRes> getTravelBanCasesDetail(String cId)async {

    TravelBanCaseDetailRes travelBanCaseDetailRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting travel-ban started.........');
      var response = await http.get('${Const.BASE_URL}/admin/travel-ban-case-details/$cId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('travel-ban ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        travelBanCaseDetailRes =  travelBanCaseDetailResFromJson(responseBody);
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
    return travelBanCaseDetailRes;
  }

}