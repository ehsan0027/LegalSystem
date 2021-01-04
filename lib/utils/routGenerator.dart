import 'package:flutter/material.dart';
import 'package:legal_system/features/case_detail/case_detail.dart';
import 'package:legal_system/features/case_type/auction/auction_home.dart';
import 'package:legal_system/features/case_type/civil_case/civil_case_home.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/auction/AuctionCases.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/court_proceeding/court_proceeding.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/execution/execution.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/expert_opinion/expert_opinion.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/firm_civil_case.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/firm_civil_case_details.dart';
import 'package:legal_system/features/case_type/civil_case/firm_civil_case/judgement/judgement.dart';
import 'package:legal_system/features/case_type/criminal_case/criminal_case_home.dart';
import 'package:legal_system/features/case_type/criminal_case/firm_criminal_case/criminal_%20case_detail.dart';
import 'package:legal_system/features/case_type/criminal_case/firm_criminal_case/firm_criminal_case.dart';
import 'package:legal_system/features/case_type/foreign_case/foreign_case_home.dart';
import 'package:legal_system/features/case_type/foreign_case/foreign_case_type/foreign_case.dart';
import 'package:legal_system/features/case_type/foreign_case/foreign_case_type/foreign_case_type.dart';
import 'package:legal_system/features/case_type/foreign_case/foreign_case_type/foreign_civil_case_detail.dart';
import 'package:legal_system/features/case_type/foreign_case/foreign_case_type/foreign_criminal_case_detail.dart';
import 'package:legal_system/features/case_type/interpol_case/interpol_case_detail.dart';
import 'package:legal_system/features/case_type/interpol_case/interpol_case_home.dart';
import 'package:legal_system/features/case_type/interpol_case/interpol_cases.dart';
import 'package:legal_system/features/case_type/law_firm/law_firm_detail/law_firm_details.dart';
import 'package:legal_system/features/case_type/law_firm/law_firm_home.dart';
import 'package:legal_system/features/case_type/travel_ban/travel_ban_case.dart';
import 'package:legal_system/features/case_type/travel_ban/travel_ban_case_detail.dart';
import 'package:legal_system/features/case_type/travel_ban/travel_ban_home.dart';
import 'package:legal_system/features/coordinator/dashboard/coordinator_dashboard.dart';
import 'package:legal_system/features/coordinator/request/coordinator_request.dart';
import 'package:legal_system/features/coordinator/request/coordinator_view_request.dart';
import 'package:legal_system/features/dashboard/dashboard.dart';
import 'package:legal_system/features/notification/Notification_detail.dart';
import 'package:legal_system/features/notification/notifications.dart';
import 'package:legal_system/features/splashscreen/splash_screen.dart';
import 'package:legal_system/model/foreign_civil_case_detail_res.dart';

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
      case '/lawFirmHome':
        {
          return MaterialPageRoute(builder: (_) => LawFirmHome());
        }
      case '/civilCaseHome':
        {
          return MaterialPageRoute(builder: (_) => CivilCaseHome());
        }
      case '/criminalCaseHome':
        {
          return MaterialPageRoute(builder: (_) => CriminalCaseHome());
        }
      case '/foreignCaseHome':
        {
          return MaterialPageRoute(builder: (_) => ForeignCaseHome());
        }
      case '/interpolCaseHome':
        {
          return MaterialPageRoute(builder: (_) => InterPolCaseHome());
        }
      case '/travelBanHome':
        {
          return MaterialPageRoute(builder: (_) => TravelBanHome());
        }
      case '/auctionHome':
        {
          return MaterialPageRoute(builder: (_) => AuctionHome());
        }
      case '/lawFirmDetail':
        {
          return MaterialPageRoute(
              builder: (_) => LawFirmDetail(
                    lawFirm: args,
                  ));
        }
      case '/firmCivilCases':
        {
          return MaterialPageRoute(
              builder: (_) => FirmCivilCases(
                    id: args,
                  ));
        }
      case '/civilCourtProceeding':
        {
          return MaterialPageRoute(
              builder: (_) => CourtProcedding(
                    fId: args,
                  ));
        }
      case '/firmCivilCaseDetails':
        {
          return MaterialPageRoute(
              builder: (_) => CivilCaseDetail(
                    caseId: args,
                  ));
        }
      case '/civilExpertOpinion':
        {
          return MaterialPageRoute(
              builder: (_) => ExpertOpinion(
                    firmId: args,
                  ));
        }
      case '/civilJudgement':
        {
          return MaterialPageRoute(
              builder: (_) => Judgement(
                    firmId: args,
                  ));
        }
      case '/civilExecution':
        {
          return MaterialPageRoute(
              builder: (_) => Execution(
                    firmId: args,
                  ));
        }
      case '/civilAuction':
        {
          return MaterialPageRoute(
              builder: (_) => AuctionCases(
                    firmId: args,
                  ));
        }
      case '/firmCriminalCases':
        {
          return MaterialPageRoute(
              builder: (_) => FirmCriminalCases(
                    firmId: args,
                  ));
        }

      case '/firmCriminalCaseDetails':
        {
          return MaterialPageRoute(
              builder: (_) => CriminalCaseDetails(
                caseId: args,
              ));
        }

      case '/foreignCaseType':
        {
          return MaterialPageRoute(
              builder: (_) => ForeignCaseTypes(
                fId: args,
              ));
        }
      case '/foreignCases':
        {
          return MaterialPageRoute(
              builder: (_) => ForeignCase(
                fId: args,
              ));
        }
      case '/foreignCivilCaseDetails':
        {
          return MaterialPageRoute(
              builder: (_) => ForeignCivilCaseDetail(
                caseId: args,
              ));
        }
      case '/foreignCriminalCaseDetails':
        {
          return MaterialPageRoute(
              builder: (_) => ForeignCriminalCaseDetail(
                caseId: args,
              ));
        }

      case '/interPoleCases':
        {
          return MaterialPageRoute(
              builder: (_) => InterpolCases(
                fId: args,
              ));
        }

      case '/interPoleCasesDetail':
        {
          return MaterialPageRoute(
              builder: (_) => InterpolCaseDetail(
                caseId: args,
              ));
        }

      case '/travelBanCase':
        {
          return MaterialPageRoute(
              builder: (_) => TravelBanCase(
                fId: args,
              ));
        }

      case '/travelBanCasesDetail':
        {
          return MaterialPageRoute(
              builder: (_) => TravelBanCaseDetail(
                caseId: args,
              ));
        }

      case '/caseDetail':
        {
          return MaterialPageRoute(builder: (_) => CaseDetail());
        }

        case '/coordinatorDashboard':
        {
          return MaterialPageRoute(builder: (_) => CoordinatorDashboard());
        }
      case '/coordinatorReq':
        {
          return MaterialPageRoute(builder: (_) => CoordinatorRequest(obj: args,));
        }
      case '/coordinatorViewReq':
        {
          return MaterialPageRoute(builder: (_) => CoordinatorViewReq(id: args,));
        }
      case '/notification':
        {
          return MaterialPageRoute(builder: (_) => Notifications());
        }
      case '/notificationDetails':
        {
          return MaterialPageRoute(
              builder: (_) => NotificationDetails(path: args,));}

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
