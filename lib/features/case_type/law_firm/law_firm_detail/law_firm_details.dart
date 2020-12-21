import 'package:flutter/material.dart';
import 'package:legal_system/model/foreign_case_res.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/repository/case_type_repository.dart';
import 'package:legal_system/utils/gv.dart';
class LawFirmDetail extends StatefulWidget {
 final LawFirm lawFirm;
  LawFirmDetail({this.lawFirm});
  @override
  _LawFirmDetailState createState() => _LawFirmDetailState();
}

class _LawFirmDetailState extends State<LawFirmDetail> {

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cases"),
      ),
      body: ListView(children: [
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/mayan_pyramid.png',
              width: SizeConfig.blockSizeHorizontal * 12,
              height: SizeConfig.blockSizeHorizontal * 12,
              color: MyAppColor.myPrimaryColorDark,
            ),
            title: Text("CIVIL CASES"),
            subtitle: Text("count: ${widget.lawFirm.civilCases}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {

              String fId = widget.lawFirm.id.toString();
              Navigator.of(context)
                  .pushNamed('/firmCivilCases', arguments: fId);
            },
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal,),
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/criminal.png',
              width: SizeConfig.blockSizeHorizontal * 12,
              height: SizeConfig.blockSizeHorizontal * 12,
              color: MyAppColor.myPrimaryColorDark,
            ),
            title: Text("CRIMINAL CASES"),
            subtitle: Text("count: ${widget.lawFirm.criminalCases}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {

              String id = widget.lawFirm.id.toString();
              Navigator.of(context)
                  .pushNamed('/firmCriminalCases', arguments: id);

            },
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal,),
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/worldwide.png',
              width: SizeConfig.blockSizeHorizontal * 12,
              height: SizeConfig.blockSizeHorizontal * 12,
              color: MyAppColor.myPrimaryColorDark,
            ),
            title: Text( "FOREIGN CASES"),
            subtitle: Text("count: ${widget.lawFirm.foreignCases}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () async{

              String fId=widget.lawFirm.id.toString();

              Navigator.of(context).pushNamed(
                  '/foreignCaseType',arguments: fId
              );            },
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal,),
         Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/policeman.png',
              width: SizeConfig.blockSizeHorizontal * 12,
              height: SizeConfig.blockSizeHorizontal * 12,
              color: MyAppColor.myPrimaryColorDark,
            ),
            title: Text(  "INTERPOL"),
            subtitle: Text("count: ${widget.lawFirm.interpolCases}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {

              String firmId = widget.lawFirm.id.toString();
              Navigator.of(context)
                  .pushNamed('/interPoleCases', arguments: firmId);
            },
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeHorizontal,),
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/airplane.png',
              width: SizeConfig.blockSizeHorizontal * 12,
              height: SizeConfig.blockSizeHorizontal * 12,
              color: MyAppColor.myPrimaryColorDark,
            ),
            title: Text(  "TRAVEL BAN"),
            subtitle: Text("count: ${widget.lawFirm.travelCases}"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: MyAppColor.myPrimaryColor,
            ),
            onTap: () {

              String firmId=widget.lawFirm.id.toString();
              Navigator.of(context).pushNamed('/travelBanCase',arguments: firmId);
            },
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical,),



      ],),

    );
  }
}
