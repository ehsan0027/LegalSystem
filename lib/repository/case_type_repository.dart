import 'dart:io';

import 'package:legal_system/model/auction_res.dart';
import 'package:legal_system/model/civil_case_res.dart';
import 'package:legal_system/model/criminal_case_res.dart';
import 'package:legal_system/model/foreign_case_res.dart';
import 'package:legal_system/model/interpol_case_res.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/model/travel_ban_res.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
abstract class CaseTypeRepo{
Future<LawFirmRes> getLawFirms();
Future<CivilCasesRes> getCivilCases();
Future<CriminalCasesRes> getCriminalCases();
Future<ForeignCasesRes> getForeignCases();
Future<InterpolCasesRes> getInterpolCases();
Future<TravelBanRes> getTravelBanCases();
Future<AuctionRes> getAuctionCases();
}

class CaseTypeRepoImpl extends CaseTypeRepo{

  @override
  Future<LawFirmRes> getLawFirms() async{
   LawFirmRes lawFirmRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting Law firms started.........');
      var response = await http.get('${Const.BASE_URL}/admin/law-firms',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('Law firms ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        lawFirmRes = lawFirmResFromJson(responseBody);
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
    return lawFirmRes;

  }

  @override
  Future<CivilCasesRes> getCivilCases() async{
    CivilCasesRes civilCasesRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting Civil Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/civil-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('Civil Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        civilCasesRes = civilCasesResFromJson(responseBody);
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
    return civilCasesRes;

  }

  @override
  Future<CriminalCasesRes> getCriminalCases() async{


    CriminalCasesRes criminalCasesRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting criminal Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/criminal-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('criminal Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        criminalCasesRes = criminalCasesResFromJson(responseBody);
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
    return criminalCasesRes;


  }

  @override
  Future<ForeignCasesRes> getForeignCases()async {
    ForeignCasesRes foreignCasesRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting foreign Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/foreign-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('foreign Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        foreignCasesRes = foreignCasesResFromJson(responseBody);
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
    return foreignCasesRes;

  }

  @override
  Future<InterpolCasesRes> getInterpolCases() async{

    InterpolCasesRes interpolCasesRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting interpol Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/interpol-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('interpol Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        interpolCasesRes = interpolCasesResFromJson(responseBody);
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
    return interpolCasesRes;

  }

  @override
  Future<TravelBanRes> getTravelBanCases() async{
    TravelBanRes travelBanRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting travel Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/travel-ban-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('travel Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        travelBanRes = travelBanResFromJson(responseBody);
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
    return travelBanRes;

  }

  @override
  Future<AuctionRes> getAuctionCases() async{

    AuctionRes auctionRes;
    int timeout = 5;
    try {
      print("token :${GV.USER_TOKEN}");
      print('getting auction Cases started.........');
      var response = await http.get('${Const.BASE_URL}/admin/auction-cases',
        headers: {HttpHeaders.authorizationHeader: "Bearer ${GV.USER_TOKEN}"},
      ).timeout(Duration(seconds: timeout));
      print('auction Cases ended.........');
      if (response.statusCode == 200) {
        final responseBody = response.body;
        auctionRes = auctionResFromJson(responseBody);
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
    return auctionRes;


  }

}