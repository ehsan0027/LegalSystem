import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:legal_system/model/case_model.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardBloc _dashboardBloc;
  @override
  void initState() {
    _dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    _dashboardBloc.add(GetAllCases());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed('/notification');
            },
          )
        ],
      ),
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardLoaded) {
            print("dashboard loaded");
          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardInitial) {
              return buildInitial();
            } else if (state is DashboardLoaded) {
              return buildLoaded();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitial() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildLoaded() {
    return ListView(
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
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 4,
                    ),
                    Text(
                      "CASES FILED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 5),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    Text(
                      "27",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.blockSizeHorizontal * 13),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/casefiled.png',
                  width: SizeConfig.blockSizeHorizontal * 37,
                  height: SizeConfig.blockSizeHorizontal * 37,
                  fit: BoxFit.cover,
                  color: MyAppColor.myPrimaryColorDark,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "CIVIL CASES",
                        count: "07",
                        img: 'assets/images/mayan_pyramid.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "07",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/mayan_pyramid.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "CIVIL CASES",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "CRIMINAL CASES",
                        count: "05",
                        img: 'assets/images/criminal.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "05",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/criminal.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "CRIMINAL CASES",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "FOREIGN CASES",
                        count: "02",
                        img: 'assets/images/worldwide.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "02",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/worldwide.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "FOREIGN CASES",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "JURISDICTION",
                        count: "04",
                        img: 'assets/images/court.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "04",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/court.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "JURISDICTION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "AUCTION",
                        count: "10",
                        img: 'assets/images/auction.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/auction.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "AUCTION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "INTERPOL",
                        count: "01",
                        img: 'assets/images/policeman.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/policeman.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "INTERPOL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "TRAVEL BAN",
                        count: "02",
                        img: 'assets/images/airplane.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "02",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/airplane.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "TRAVEL BAN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    CaseModel m = CaseModel(
                        title: "CASES AGAINST",
                        count: "05",
                        img: 'assets/images/mayan_pyramid.png');
                    Navigator.of(context).pushNamed('/caseHome', arguments: m);
                  },
                  child: Container(
                    width: (SizeConfig.screenWidth - 10) / 2,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "05",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockSizeHorizontal * 7,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 10,
                            ),
                            Image.asset(
                              'assets/images/mayan_pyramid.png',
                              width: SizeConfig.blockSizeHorizontal * 12,
                              height: SizeConfig.blockSizeHorizontal * 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical,
                        ),
                        Text(
                          "CASES AGAINST",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
