import 'package:flutter/material.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/routGenerator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyAppColor.myPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cursorColor: MyAppColor.myPrimaryColor,
        accentColor:MyAppColor.myPrimaryColor,
        hintColor: MyAppColor.myPrimaryColor,
        focusColor:MyAppColor.myPrimaryColor,

      ),
      initialRoute: '/',
      onGenerateRoute: RoutGenerator.generateRoute,
    );
  }
}
