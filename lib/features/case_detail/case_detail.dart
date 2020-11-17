import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
class CaseDetail extends StatefulWidget {
  @override
  _CaseDetailState createState() => _CaseDetailState();
}

class _CaseDetailState extends State<CaseDetail> {

  List<String> _case_status = ["In Process", "Closed"];
  String _case_status_value = "In Process";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Case Detail"),
        ),
        body: ListView(children: [

          Container(
            width: SizeConfig.screenWidth,
            child: Padding(
              padding:  EdgeInsets.all(SizeConfig.blockSizeHorizontal*5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: Text("Name",style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    child: Text("Taymoor Akbar",style: TextStyle(
                        color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*5,

                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),
                  //..............name end
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Container(

                    child: Text("Nationality",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Container(
                    child: Text("Pakistan",style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeHorizontal*5,
                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),
                   //.............nationality end
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Container(

                    child: Text("Law Firm",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Container(
                    child: Text("RIAA Barker Gillette",style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeHorizontal*5,
                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),
                 //............law firm end
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Container(
                    child: Text("Hearing date",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Container(
                    child: Text("10-12-2020",style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeHorizontal*5,
                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),

                 //............hearing date end
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Container(

                    child: Text("Court",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Container(
                    child: Text("High Court",style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeHorizontal*5,
                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),
                  //.............. court end
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Container(

                    child: Text("Case No",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Container(
                    child: Text("987403",style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockSizeHorizontal*5,
                    ),),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical,),
                  Divider(height: 10,),

                  SizedBox(height: SizeConfig.blockSizeVertical*3,),

                  //Case Status
                  Container(

                    child: Text("Case Status",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold

                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioGroup<String>.builder(
                        direction: Axis.horizontal,
                        groupValue: _case_status_value,
                        onChanged: (value) => setState(() {
                          _case_status_value = value;

                        }),
                        items: _case_status,
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                        ),
                      ),
                    ],
                  ),

                  //Add Remarks
                  SizedBox(height: SizeConfig.blockSizeVertical*4,),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical*20,
                    decoration:BoxDecoration(
                      border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: MyAppColor.myPrimaryColorDark,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Add your remarks here..."),
                    )
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical*4,),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                              color: MyAppColor.myPrimaryColor)),
                      color: MyAppColor.myPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.blockSizeHorizontal * 5),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                            SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),







                ],
              ),
            ),
          )


        ],),
      ),
    );
  }
}
