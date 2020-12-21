import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/foreign_case/bloc/foreign_case_bloc.dart';
import 'package:legal_system/features/case_type/interpol_case/bloc/interpol_case_bloc.dart';
import 'package:legal_system/model/interpol_case_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class InterPolCaseHome extends StatefulWidget {
  @override
  _InterPolCaseHomeState createState() => _InterPolCaseHomeState();
}

class _InterPolCaseHomeState extends State<InterPolCaseHome> {
  InterpolCaseBloc _interpolCaseBloc;

  @override
  void initState() {
    _interpolCaseBloc = BlocProvider.of<InterpolCaseBloc>(context);
    _interpolCaseBloc.add(GetInterpolCase());
  }

  @override
  void dispose() {
    print("Dispose called");
    _interpolCaseBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<InterpolCaseBloc, InterpolCaseState>(
        listener: (context, state) {
          if (state is ForeignCaseLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<InterpolCaseBloc, InterpolCaseState>(
          builder: (context, state) {
            if (state is InterpolCaseInitial) {
              return MyWidget.buildInitial();
            } else if (state is InterpolCaseLoaded) {
              return _buildLoadedInterpolCase(state.interpolCasesRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedInterpolCase(InterpolCasesRes res) {
    final data = res.interpolCases;

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
                    'assets/images/policeman.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].lawFirm}"),
                  subtitle: Text("Foreign Cases: ${data[index].interpolCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    String firmId = data[index].id.toString();
                    Navigator.of(context)
                        .pushNamed('/interPoleCases', arguments: firmId);
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
