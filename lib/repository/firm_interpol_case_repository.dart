import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/model/interpol_case_detail_res.dart';
import 'package:legal_system/model/interpol_case_res.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:legal_system/utils/stringsData.dart';

abstract class FirmInterpolCaseRepo{
  Future<CaseRes> getInterpolCases(String fId);
  Future<InterpolCaseDetailRes> getInterpolCaseDetail(String cId);

}
class FirmInterpolCaseRepoImpl extends FirmInterpolCaseRepo{
  @override
  Future<CaseRes> getInterpolCases(String fId) async {

    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmInterpolCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/interpol/$fId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmInterpolCase ended.........');
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
  Future<InterpolCaseDetailRes> getInterpolCaseDetail(String cId) async {
    InterpolCaseDetailRes interpolCaseDetailRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmInterpolCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/interpol-case-details/$cId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmInterpolCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        interpolCaseDetailRes = interpolCaseDetailResFromJson(responseBody);
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
    return interpolCaseDetailRes;

  }

}