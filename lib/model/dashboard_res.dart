// To parse this JSON data, do
//
//     final dashboardRes = dashboardResFromJson(jsonString);

import 'dart:convert';

DashboardRes dashboardResFromJson(String str) => DashboardRes.fromJson(json.decode(str));

String dashboardResToJson(DashboardRes data) => json.encode(data.toJson());

class DashboardRes {
  DashboardRes({
    this.data,
  });

  Data data;

  factory DashboardRes.fromJson(Map<String, dynamic> json) => DashboardRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.casesFiled,
    this.casesAgainst,
    this.lawFirms,
    this.civilCases,
    this.criminalCases,
    this.interpolCases,
    this.travelCases,
    this.foreignCases,
    this.auction,
  });

  int casesFiled;
  int casesAgainst;
  int lawFirms;
  int civilCases;
  int criminalCases;
  int interpolCases;
  int travelCases;
  int foreignCases;
  int auction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    casesFiled: json["cases_filed"],
    casesAgainst: json["cases_against"],
    lawFirms: json["law_firms"],
    civilCases: json["civil_cases"],
    criminalCases: json["criminal_cases"],
    interpolCases: json["interpol_cases"],
    travelCases: json["travel_cases"],
    foreignCases: json["foreign_cases"],
    auction: json["auction"],
  );

  Map<String, dynamic> toJson() => {
    "cases_filed": casesFiled,
    "cases_against": casesAgainst,
    "law_firms": lawFirms,
    "civil_cases": civilCases,
    "criminal_cases": criminalCases,
    "interpol_cases": interpolCases,
    "travel_cases": travelCases,
    "foreign_cases": foreignCases,
    "auction": auction,
  };
}
