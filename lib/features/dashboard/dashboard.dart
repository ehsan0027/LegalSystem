import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:legal_system/model/case_model.dart';
import 'package:legal_system/model/dashboard_res.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';
import 'package:legal_system/utils/push_notifications.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardBloc _dashboardBloc;
  MyPushNotification _pushNotification;
  @override
  void initState() {
    _pushNotification=MyPushNotification();
    _pushNotification.init();
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
              return MyWidget.buildInitial();
            } else if (state is DashboardLoaded) {
              return _buildLoaded(state.dashboardRes);
            }
            return MyWidget.buildError();
          },
        ),
      ),
    );
  }

  Widget _buildLoaded(DashboardRes res) {

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
                      "${res.data.casesFiled}",
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
                    Navigator.of(context).pushNamed('/civilCaseHome');
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
                              "${res.data.civilCases}",
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

                    Navigator.of(context).pushNamed('/criminalCaseHome');
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
                              "${res.data.criminalCases}",
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
                    Navigator.of(context).pushNamed('/foreignCaseHome');
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
                              "${res.data.foreignCases}",
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

                    // Navigator.of(context).pushNamed('/caseHome', arguments: m);
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
                              "${res.data.casesAgainst}",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {

                    Navigator.of(context).pushNamed('/auctionHome');
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
                              "${res.data.auction}",
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
                    Navigator.of(context).pushNamed('/interpolCaseHome');
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
                              "${res.data.interpolCases}",
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
              flex: 1,
              child: Card(
                color: MyAppColor.myPrimaryColor,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/travelBanHome');
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
                              "${res.data.travelCases}",
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
                    Navigator.of(context).pushNamed('/lawFirmHome');
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
                              "${res.data.lawFirms}",
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
                          "Law Firms",
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
