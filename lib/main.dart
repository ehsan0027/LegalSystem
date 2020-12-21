import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/auction/bloc/auction_bloc.dart';
import 'package:legal_system/features/case_type/civil_case/bloc/civil_case_bloc.dart';
import 'package:legal_system/features/case_type/criminal_case/bloc/criminal_case_bloc.dart';
import 'package:legal_system/features/case_type/foreign_case/bloc/foreign_case_bloc.dart';
import 'package:legal_system/features/case_type/interpol_case/bloc/interpol_case_bloc.dart';
import 'package:legal_system/features/case_type/travel_ban/bloc/travel_ban_bloc.dart';
import 'package:legal_system/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:legal_system/features/login/login_bloc.dart';
import 'package:legal_system/repository/auth_repository.dart';
import 'package:legal_system/repository/case_type_repository.dart';
import 'package:legal_system/repository/dashboard_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/routGenerator.dart';
import 'features/case_type/law_firm/bloc/law_firm_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(authRepository: AuthRepositoryImpl()),),
        BlocProvider<DashboardBloc>(
          create: (BuildContext context) =>
              DashboardBloc(dashboardRepo: DashboardRepoImpl()),),
        BlocProvider<LawFirmBloc>(
            create: (BuildContext context) =>
                LawFirmBloc(caseTypeRepo: CaseTypeRepoImpl())),

        BlocProvider<CivilCaseBloc>(
            create: (BuildContext context) =>
                CivilCaseBloc(caseTypeRepo: CaseTypeRepoImpl())),

        BlocProvider<CriminalCaseBloc>(
            create: (BuildContext context) =>
                CriminalCaseBloc(caseTypeRepo: CaseTypeRepoImpl())),
        BlocProvider<ForeignCaseBloc>(
            create: (BuildContext context) =>
                ForeignCaseBloc(caseTypeRepo: CaseTypeRepoImpl())),
        BlocProvider<InterpolCaseBloc>(
            create: (BuildContext context) =>
                InterpolCaseBloc(caseTypeRepo: CaseTypeRepoImpl())),
        BlocProvider<TravelBanBloc>(
            create: (BuildContext context) =>
                TravelBanBloc(caseTypeRepo: CaseTypeRepoImpl())),
        BlocProvider<AuctionBloc>(
            create: (BuildContext context) =>
                AuctionBloc(caseTypeRepo: CaseTypeRepoImpl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: MyAppColor.myPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cursorColor: MyAppColor.myPrimaryColor,
          accentColor: MyAppColor.myPrimaryColor,
          hintColor: MyAppColor.myPrimaryColor,
          focusColor: MyAppColor.myPrimaryColor,
        ),
        initialRoute: '/',
        onGenerateRoute: RoutGenerator.generateRoute,
      ),
    );
  }
}
