import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/case_type/bloc/case_type_bloc.dart';
import 'package:legal_system/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:legal_system/features/login/login_bloc.dart';
import 'package:legal_system/repository/auth_repository.dart';
import 'package:legal_system/repository/case_type_repository.dart';
import 'package:legal_system/repository/dashboard_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/routGenerator.dart';

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
              LoginBloc(authRepository: AuthRepositoryImpl()),
        ),
        BlocProvider<DashboardBloc>(
          create: (BuildContext context) =>
              DashboardBloc(dashboardRepo: DashboardRepoImpl()),
        ),
        BlocProvider<CaseTypeBloc>(
            create: (BuildContext context) => CaseTypeBloc(caseTypeRepo: CaseTypeRepoImpl())),
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
