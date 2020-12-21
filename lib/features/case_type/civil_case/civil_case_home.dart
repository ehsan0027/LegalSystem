import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/civil_case/bloc/civil_case_bloc.dart';
import 'package:legal_system/model/civil_case_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class CivilCaseHome extends StatefulWidget {
  @override
  _CivilCaseHomeState createState() => _CivilCaseHomeState();
}

class _CivilCaseHomeState extends State<CivilCaseHome> {
  CivilCaseBloc _civilCaseBloc;

  @override
  void initState() {
    _civilCaseBloc = BlocProvider.of<CivilCaseBloc>(context);
    _civilCaseBloc.add(GetCivilCases());
    print("init Called");

  }

  @override
  void dispose() {
    print("Dispose called");
    _civilCaseBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<CivilCaseBloc, CivilCaseState>(
        listener: (context, state) {
          if (state is CivilCaseLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<CivilCaseBloc, CivilCaseState>(
          builder: (context, state) {
            if (state is CivilCaseInitial) {
              return MyWidget.buildInitial();
            } else if (state is CivilCaseLoaded) {
              return _buildLoadedCivilCase(state.civilCasesRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedCivilCase(CivilCasesRes res) {
    final data = res.civilCases;

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
                    'assets/images/mayan_pyramid.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    fit: BoxFit.cover,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].lawFirm}"),
                  subtitle: Text("Civil Cases: ${data[index].civilCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    String id = data[index].id.toString();
                    Navigator.of(context)
                        .pushNamed('/firmCivilCases', arguments: id);
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
