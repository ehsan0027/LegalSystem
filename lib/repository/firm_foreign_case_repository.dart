import 'package:legal_system/model/case_res.dart';
import 'package:legal_system/model/foreign_civil_case_detail_res.dart';
import 'package:legal_system/model/foreign_criminal_case_detail_res.dart';
import 'package:legal_system/model/foreign_typed_case_res.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:legal_system/utils/stringsData.dart';
abstract class FirmForeignCaseRepo{
  Future<ForeignCivilCaseDetailRes>  getForeignCivilCaseDetail(String cId);
  Future< ForeignCriminalCaseDetailRes >  getForeignCriminalCaseDetail(String cId);
  Future<CaseRes> getForeignCivilCase(String fid);
  Future<CaseRes> getForeignCriminalCase(String fid);
  Future<ForeignTypedCaseRes> getForeignTypeCases(String fId);

}

class FirmForeignCaseRepoImpl extends FirmForeignCaseRepo{
  @override
  Future<ForeignCivilCaseDetailRes> getForeignCivilCaseDetail(String cId)async {

    ForeignCivilCaseDetailRes  foreignCivilCaseDetailRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign/civil-case-details/$cId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        foreignCivilCaseDetailRes = foreignCivilCaseDetailResFromJson(responseBody);
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
    return foreignCivilCaseDetailRes;
  }
  @override
  Future<ForeignCriminalCaseDetailRes> getForeignCriminalCaseDetail(String cId)async {

    ForeignCriminalCaseDetailRes  foreignCriminalCaseDetailRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign/criminal-case-details/$cId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmCivilCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        foreignCriminalCaseDetailRes =  foreignCriminalCaseDetailResFromJson(responseBody);
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
    return foreignCriminalCaseDetailRes;
  }

  @override
  Future<CaseRes> getForeignCivilCase(String fId) async{
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign/civil-cases-list/$fId',
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
  Future<CaseRes> getForeignCriminalCase(String fId) async{
    CaseRes caseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmCivilCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign/criminal-cases-list/$fId',
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
  Future<ForeignTypedCaseRes> getForeignTypeCases(String fId)async {

    ForeignTypedCaseRes foreignTypedCaseRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting firmForeignCase started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign/firm-foreign-cases/$fId',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('firmForeignCase ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        foreignTypedCaseRes =  foreignTypedCaseResFromJson(responseBody);
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
    return foreignTypedCaseRes;

  }


}
