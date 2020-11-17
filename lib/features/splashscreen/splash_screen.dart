import 'dart:async';

import 'package:flutter/material.dart';
import 'package:legal_system/features/login/UserLogin.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => UserLogin()));

            }

            );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor:MyAppColor.myPrimaryColor,
      body: Center(
        child: Image.asset('assets/images/mmlogix_ic.png',
          color: Colors.white,
          width: SizeConfig.blockSizeHorizontal *25,
          height: SizeConfig.blockSizeHorizontal *30,
         ),
      ),
    );
  }
}