import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/criminal_case/bloc/criminal_case_bloc.dart';
import 'package:legal_system/model/criminal_case_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
class CriminalCaseHome extends StatefulWidget {
  @override
  _CriminalCaseHomeState createState() => _CriminalCaseHomeState();
}

class _CriminalCaseHomeState extends State<CriminalCaseHome> {
  CriminalCaseBloc _criminalCaseBloc;

  @override
  void initState() {
    _criminalCaseBloc = BlocProvider.of<CriminalCaseBloc>(context);
    _criminalCaseBloc.add(GetCriminlCase());
  }

  @override
  void dispose() {
    print("Dispose called");
    _criminalCaseBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<CriminalCaseBloc, CriminalCaseState>(
        listener: (context, state) {
          if (state is CriminalCaseLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<CriminalCaseBloc, CriminalCaseState>(
          builder: (context, state) {
            if (state is CriminalCaseInitial) {
              return MyWidget.buildInitial();
            } else if (state is CriminalCaseLoaded) {
              return _buildLoadedCriminalCase(state.criminalCasesRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedCriminalCase(CriminalCasesRes res) {
    final data = res.criminalCases;

    if (data.isEmpty) {
      return MyWidget.buildError();
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/criminal.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    fit: BoxFit.cover,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].lawFirm}"),
                  subtitle: Text("Criminal Cases: ${data[index].criminalCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    String id = data[index].id.toString();
                    Navigator.of(context)
                        .pushNamed('/firmCriminalCases', arguments: id);

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
