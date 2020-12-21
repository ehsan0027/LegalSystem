import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/model/civil_case_details_res.dart';
import 'package:legal_system/model/firm_civil_case.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';
import 'package:legal_system/model/firm_case_res.dart';
abstract class FirmCivilCaseRepo{
  Future<FirmCaseRes> getFirmCivilCase(String f_id);
  Future<CaseRes> getCivilCourtProceedingCases(String fId);
  Future<CivilCaseDetailRes> getCivilCaseDetail(String cId);
  Future<CaseRes> getExpertOpinionCases(String fId);
  Future<CaseRes> getJudgementCases(String fId);
  Future<CaseRes> getExecutionCases(String fId);
  Future<CaseRes> getAuctionCases(String fId);
}
class FirmCivilCaseRepoImpl extends FirmCivilCaseRepo{
  @override
  Future<FirmCaseRes> getFirmCivilCase(String f_id) async{
    FirmCaseRes firmCaseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$f_id',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        firmCaseRes = firmCaseResFromJson(responseBody);
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
    return firmCaseRes;
  }

  @override
  Future<CaseRes> getCivilCourtProceedingCases(String fId)async {
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$fId/civil-court',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
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
  Future<CaseRes> getExpertOpinionCases(String fId) async{
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$fId/expert-opinion',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
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
  Future<CaseRes> getJudgementCases(String fId) async{
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$fId/judgement',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
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
  Future<CaseRes> getExecutionCases(String fId) async{

    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting execution started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$fId/execution',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('execution ended.........');
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
  Future<CaseRes> getAuctionCases(String fId) async{
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting auction started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/$fId/auction',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('auction ended.........');
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
  Future<CivilCaseDetailRes> getCivilCaseDetail(String cId) async{

    CivilCaseDetailRes  civilCaseDetailRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil/get-case-details/$cId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        civilCaseDetailRes = civilCaseDetailResFromJson(responseBody);
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
    return civilCaseDetailRes;
  }


}