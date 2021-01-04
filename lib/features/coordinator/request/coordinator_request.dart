import 'package:flutter/material.dart';
import 'package:legal_system/model/coordinator/coordinator_request_res.dart';
import 'package:legal_system/utils/app_color.dart';

class CoordinatorRequest extends StatefulWidget {
  final CoordinatorRequestsRes obj;

  CoordinatorRequest({this.obj});

  @override
  _CoordinatorRequestState createState() => _CoordinatorRequestState();
}

class _CoordinatorRequestState extends State<CoordinatorRequest> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Request"),
      ),
      body: ListView.builder(
        itemCount: widget.obj.data.length,
        itemBuilder: (ctx,index){
          return Card(
            child: ListTile(
              title: Text("${widget.obj.data[index].customerName}"),
              subtitle:
              Text("${widget.obj.data[index].status}"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: MyAppColor.myPrimaryColor,
              ),
              onTap: () {
                String id=widget.obj.data[index].id.toString();
                Navigator.of(context).pushNamed('/coordinatorViewReq',arguments: id);

              },
            ),
          );
        },
      ),
    );
  }
}
