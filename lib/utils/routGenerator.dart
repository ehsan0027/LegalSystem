import 'package:flutter/material.dart';
import 'package:legal_system/features/case_detail/case_detail.dart';
import 'file:///C:/Users/CDOXS-5/Documents/legal_system/lib/features/case_type/case_home.dart';
import 'package:legal_system/features/dashboard/dashboard.dart';
import 'package:legal_system/features/notification/notifications.dart';
import 'package:legal_system/features/splashscreen/splash_screen.dart';
class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
        case '/dashboard':
        {
          return MaterialPageRoute(builder: (_) => Dashboard());
        }
      case '/caseHome':
        {
          return MaterialPageRoute(builder: (_) => CaseHome(args));
        }
        case '/caseDetail':
        {
          return MaterialPageRoute(builder: (_) => CaseDetail());
        }
        case '/notification':
        {
          return MaterialPageRoute(builder: (_) => Notifications());
        }

      default:
        errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
