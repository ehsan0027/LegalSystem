import 'package:flutter/material.dart';
import 'package:legal_system/model/coordinator/coordinator_request_res.dart';
import 'package:legal_system/repository/coordinator_repository.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
import 'package:legal_system/utils/widgets.dart';

class CoordinatorDashboard extends StatefulWidget {
  @override
  _CoordinatorDashboardState createState() => _CoordinatorDashboardState();
}

class _CoordinatorDashboardState extends State<CoordinatorDashboard> {
  Future<CoordinatorRequestsRes> getRequest;

  @override
  void initState() {
    CoordinatorRepo coordinatorRepo;
    coordinatorRepo = CoordinatorRepoImpl();
    getRequest = coordinatorRepo.getCoordinatorReq();

    super.initState();
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
      body: FutureBuilder<CoordinatorRequestsRes>(
        future: getRequest,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var reqList=snapshot.data.data;
            return Container(
              child: Column(
                children: [
                  Card(
                    elevation: SizeConfig.blockSizeVertical,
                    child: InkWell(
                      onTap: () {
                        print('clicked');
                        Navigator.of(context).pushNamed('/coordinatorReq',arguments: snapshot.data);
                      },
                      child: Container(
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
                                    "Requests",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 5),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  Text(
                                    "${reqList.length}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal *
                                                13),
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
                    ),
                  ),
                ],
              ),
            );
          }
        return  MyWidget.buildInitial();
        },
      ),
    );
  }
}
