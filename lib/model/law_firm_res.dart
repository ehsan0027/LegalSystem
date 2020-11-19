// To parse this JSON data, do
//
//     final lawFirmRes = lawFirmResFromJson(jsonString);

import 'dart:convert';

LawFirmRes lawFirmResFromJson(String str) => LawFirmRes.fromJson(json.decode(str));

String lawFirmResToJson(LawFirmRes data) => json.encode(data.toJson());

class LawFirmRes {
  LawFirmRes({
    this.lawFirms,
  });

  List<LawFirm> lawFirms;

  factory LawFirmRes.fromJson(Map<String, dynamic> json) => LawFirmRes(
    lawFirms: List<LawFirm>.from(json["law firms"].map((x) => LawFirm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "law firms": List<dynamic>.from(lawFirms.map((x) => x.toJson())),
  };
}

class LawFirm {
  LawFirm({
    this.id,
    this.firmCode,
    this.firmName,
    this.totalCases,
    this.civilCases,
    this.criminalCases,
    this.interpolCases,
    this.travelCases,
    this.foreignCases,
  });

  int id;
  String firmCode;
  String firmName;
  int totalCases;
  int civilCases;
  int criminalCases;
  int interpolCases;
  int travelCases;
  int foreignCases;

  factory LawFirm.fromJson(Map<String, dynamic> json) => LawFirm(
    id: json["id"],
    firmCode: json["firm_code"],
    firmName: json["firm_name"],
    totalCases: json["total_cases"],
    civilCases: json["civil_cases"],
    criminalCases: json["criminal_cases"],
    interpolCases: json["interpol_cases"],
    travelCases: json["travel_cases"],
    foreignCases: json["foreign_cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_code": firmCode,
    "firm_name": firmName,
    "total_cases": totalCases,
    "civil_cases": civilCases,
    "criminal_cases": criminalCases,
    "interpol_cases": interpolCases,
    "travel_cases": travelCases,
    "foreign_cases": foreignCases,
  };
}
