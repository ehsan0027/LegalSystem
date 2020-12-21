// To parse this JSON data, do
//
//     final criminalCasesRes = criminalCasesResFromJson(jsonString);

import 'dart:convert';

CriminalCasesRes criminalCasesResFromJson(String str) => CriminalCasesRes.fromJson(json.decode(str));

String criminalCasesResToJson(CriminalCasesRes data) => json.encode(data.toJson());

class CriminalCasesRes {
  CriminalCasesRes({
    this.criminalCases,
  });

  List<CriminalCase> criminalCases;

  factory CriminalCasesRes.fromJson(Map<String, dynamic> json) => CriminalCasesRes(
    criminalCases: List<CriminalCase>.from(json["Criminal Cases"].map((x) => CriminalCase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Criminal Cases": List<dynamic>.from(criminalCases.map((x) => x.toJson())),
  };
}

class CriminalCase {
  CriminalCase({
    this.id,
    this.firmCode,
    this.lawFirm,
    this.criminalCases,
  });

  int id;
  String firmCode;
  String lawFirm;
  int criminalCases;

  factory CriminalCase.fromJson(Map<String, dynamic> json) => CriminalCase(
    id: json["id"],
    firmCode: json["firm_code"],
    lawFirm: json["law_firm"],
    criminalCases: json["criminal_cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_code": firmCode,
    "law_firm": lawFirm,
    "criminal_cases": criminalCases,
  };
}
