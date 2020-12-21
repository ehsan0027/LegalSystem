// To parse this JSON data, do
//
//     final civilCasesRes = civilCasesResFromJson(jsonString);

import 'dart:convert';

CivilCasesRes civilCasesResFromJson(String str) => CivilCasesRes.fromJson(json.decode(str));

String civilCasesResToJson(CivilCasesRes data) => json.encode(data.toJson());

class CivilCasesRes {
  CivilCasesRes({
    this.civilCases,
  });

  List<CivilCase> civilCases;

  factory CivilCasesRes.fromJson(Map<String, dynamic> json) => CivilCasesRes(
    civilCases: List<CivilCase>.from(json["Civil Cases"].map((x) => CivilCase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Civil Cases": List<dynamic>.from(civilCases.map((x) => x.toJson())),
  };
}

class CivilCase {
  CivilCase({
    this.id,
    this.firmCode,
    this.lawFirm,
    this.civilCases,
  });

  int id;
  String firmCode;
  String lawFirm;
  int civilCases;

  factory CivilCase.fromJson(Map<String, dynamic> json) => CivilCase(
    id: json["id"],
    firmCode: json["firm_code"],
    lawFirm: json["law_firm"],
    civilCases: json["civil_cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_code": firmCode,
    "law_firm": lawFirm,
    "civil_cases": civilCases,
  };
}
