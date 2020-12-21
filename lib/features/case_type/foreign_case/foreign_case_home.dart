import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/foreign_case/bloc/foreign_case_bloc.dart';
import 'package:legal_system/model/foreign_case_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/gv.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class ForeignCaseHome extends StatefulWidget {
  @override
  _ForeignCaseHomeState createState() => _ForeignCaseHomeState();
}

class _ForeignCaseHomeState extends State<ForeignCaseHome> {
  ForeignCaseBloc _foreignCaseBloc;

  @override
  void initState() {
    _foreignCaseBloc = BlocProvider.of<ForeignCaseBloc>(context);
    _foreignCaseBloc.add(GetForeignCase());
  }

  @override
  void dispose() {
    print("Dispose called");
    _foreignCaseBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Law Firm"),
      ),
      body: BlocListener<ForeignCaseBloc, ForeignCaseState>(
        listener: (context, state) {
          if (state is ForeignCaseLoaded) {
            print("caseType loaded");
          }
        },
        child: BlocBuilder<ForeignCaseBloc, ForeignCaseState>(
          builder: (context, state) {
            if (state is ForeignCaseInitial) {
              return MyWidget.buildInitial();
            } else if (state is ForeignCaseLoaded) {
              return _buildLoadedForeignCase(state.foreignCasesRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoadedForeignCase(ForeignCasesRes res) {
    final data = res.data;

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
                    'assets/images/worldwide.png',
                    width: SizeConfig.blockSizeHorizontal * 12,
                    height: SizeConfig.blockSizeHorizontal * 12,
                    fit: BoxFit.cover,
                    color: MyAppColor.myPrimaryColorDark,
                  ),
                  title: Text("${data[index].lawFirm}"),
                  subtitle:
                      Text("Foreign Cases: ${data[index].totalForeignCases}"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: MyAppColor.myPrimaryColor,
                  ),
                  onTap: () {
                    String firmId = data[index].firmId.toString();
                    Navigator.of(context)
                        .pushNamed('/foreignCaseType', arguments: firmId);
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
