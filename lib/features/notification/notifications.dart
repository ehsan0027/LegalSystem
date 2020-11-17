import 'package:flutter/material.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notification"),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: Image.asset('assets/images/mmlogix_ic.png',
                color: MyAppColor.myPrimaryColor,
                width: SizeConfig.blockSizeHorizontal *10,
                height: SizeConfig.blockSizeHorizontal *10,
              ),
              title: Text("Taymoor Akbar"),
              subtitle: Text("hearning on: 10-12-2020"),
              trailing: Icon(Icons.arrow_forward_ios,color: MyAppColor.myPrimaryColor,),
              onTap: (){
                Navigator.of(context).pushNamed('/caseDetail');
              },

            ),
          );
        },
      ),
    );
  }
}
