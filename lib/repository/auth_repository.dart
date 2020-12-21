import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:legal_system/model/login_res.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:legal_system/utils/stringsData.dart';

abstract class AuthRepository {
  Future<LoginRes> userAuth(String email, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  LoginRes _loginRes;
  @override
  Future<LoginRes> userAuth(String email, String password) async {

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    var ftoken= await _firebaseMessaging.getToken();
    print("DeviceId $ftoken");

    int timeout = 5;
    try {
      print('auth started.........');
      var response = await http.post('${Const.BASE_URL}/login', body: {
        "email": email,
        "password": password,
        "device_id":"$ftoken"
      }).timeout(Duration(seconds: timeout));
      print('auth ended.........');

      if (response.statusCode == 200) {
        final responseBody = response.body;
        _loginRes = loginResFromJson(responseBody);
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
    print("login Res${_loginRes}");
    return _loginRes;
  }
}
