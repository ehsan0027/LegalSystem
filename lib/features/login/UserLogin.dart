
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legal_system/features/login/login_bloc.dart';
import 'package:legal_system/utils/app_color.dart';
import 'package:legal_system/utils/size_configuration.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  LoginBloc _loginBloc;


  @override
  void initState() {
    _loginBloc=BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColor.myPrimaryColor,
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state){
            if (state is LoginDone) {
              print("Login is done.....");
              Navigator.of(context).pop(true);
              Navigator.of(context).pushNamed('/dashboard');
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                print("Initial State");
                return buildInitial();
              } else if (state is LoginProcesssing) {
                print("Processing State");
                return buildProcessing();
              }
              else if (state is LoginDone) {
                print("Done State ${state.msg}");
                return buildProcessing();
              }
              return buildProcessing();
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitial() {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 16,
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Consts.avatarRadius + Consts.padding,
                bottom: Consts.padding,
                left: Consts.padding,
                right: Consts.padding,
              ),
              margin: EdgeInsets.only(top: Consts.avatarRadius),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Consts.padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              primaryColor: MyAppColor.myPrimaryColor),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: MyAppColor.myPrimaryColorDark),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: MyAppColor.myPrimaryColor,
                              ),
                            ),
                            style: TextStyle(color: MyAppColor.myPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              primaryColor: MyAppColor.myPrimaryColor),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'missing password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: MyAppColor.myPrimaryColorDark),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: MyAppColor.myPrimaryColor,
                              ),
                            ),
                            style: TextStyle(color: MyAppColor.myPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 3.5,
                        ),
                        Container(
                          width: SizeConfig.screenWidth,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: MyAppColor.myPrimaryColor)),
                            color: MyAppColor.myPrimaryColor,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  SizeConfig.blockSizeHorizontal * 5),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 4.4,
                                ),
                              ),
                            ),
                            onPressed: () async{
                              //Send Decrease Counter EVent to the Bloc
                              _loginBloc.add(LoginUser(email: "abcdgmail.com",password: "1234asx"));

                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: Consts.padding,
                right: Consts.padding,
                child: Container(
                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 7),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/mmlogix_ic.png',
                    color: MyAppColor.myPrimaryColor,
                    width: SizeConfig.blockSizeHorizontal * 15,
                    height: SizeConfig.blockSizeHorizontal * 15,
                  ),
                )),
          ],
        ),
      ],
    );
  }

  Widget buildProcessing() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Center(
        child: Text("Please wait...",style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }
}

class Consts {
  Consts._();

  static const double padding = 8.0;
  static const double avatarRadius = 50.0;
}
