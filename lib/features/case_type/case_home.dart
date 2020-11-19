import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/bloc/case_type_bloc.dart';
import 'package:legal_system/model/case_model.dart';
import 'package:legal_system/model/law_firm_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class CaseHome extends StatefulWidget {
  CaseModel model;
  CaseHome(this.model);


  @override
  _CaseHomeState createState() => _CaseHomeState();
}

class _CaseHomeState extends State<CaseHome> {
  CaseTypeBloc _caseTypeBloc;


  @override
  void initState() {
    _caseTypeBloc = BlocProvider.of<CaseTypeBloc>(context);
    _caseTypeBloc.add(GetTypeCases());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Case"),
      ),
      body: BlocListener<CaseTypeBloc, CaseTypeState>(
        listener: (context, state) {
          if (state is CaseTypeLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<CaseTypeBloc, CaseTypeState>(
          builder: (context, state) {
            if (state is CaseTypeInitial) {
              return MyWidget.buildInitial();
            } else if (state is CaseTypeLoaded) {
              return _buildLoaded(state.lawFirmRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }


  Widget _buildLoaded(LawFirmRes res){
    final data=res.lawFirms;

    if(data.isEmpty)
      {
       return MyWidget.buildError();
      }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length ,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  leading:Image.asset(
                    '${widget.model.img}',
                    width: SizeConfig.blockSizeHorizontal *12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    fit: BoxFit.cover,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].firmName}"),
                  subtitle: Text("firm code : ${data[index].firmCode}"),
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
    );
  }


}
