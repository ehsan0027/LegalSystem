import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legal_system/utils/size_configuration.dart';
class MyWidget{
  static Widget buildInitial() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Center(child: CircularProgressIndicator()),
    );
  }
  static Widget buildError() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Center(child:Text("No data found")),
    );
  }

}