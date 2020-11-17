import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:legal_system/model/case_model.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
class CaseHome extends StatefulWidget {


  CaseModel model;
  CaseHome(this.model);

  @override
  _CaseHomeState createState() => _CaseHomeState();
}

class _CaseHomeState extends State<CaseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: SizeConfig.blockSizeVertical * 20,
            color: MyAppColor.myPrimaryColor,
            width: SizeConfig.screenWidth,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.blockSizeVertical *4,),
                      Text("${widget.model.title}",style: TextStyle(

                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal*5
                      ),),
                      SizedBox(height: SizeConfig.blockSizeVertical *2,),

                      Text("${widget.model.count}",style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal*13

                      ),),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    '${widget.model.img}',
                    width: SizeConfig.blockSizeHorizontal * 37,
                    height: SizeConfig.blockSizeHorizontal * 37,
                    fit: BoxFit.cover,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: int.parse(widget.model.count) ,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: Text("#5507",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeHorizontal*4.2,
                        color: MyAppColor.myPrimaryColor
                    ),),
                    title: Text("Taymoor Akbar"),
                    subtitle: Text("Court: high court"),
                    trailing: Icon(Icons.arrow_forward_ios,color: MyAppColor.myPrimaryColor,),
                onTap: (){
                  Navigator.of(context).pushNamed('/caseDetail');
                },
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
