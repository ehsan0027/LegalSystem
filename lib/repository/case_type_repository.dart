import 'dart:io';

import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';
import 'package:http/http.dart' as http;
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/stringsData.dart';
import 'dart:async';
import 'dart:io';
abstract class CaseTypeRepo{
Future<LawFirmRes> getLawFirms();
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

}