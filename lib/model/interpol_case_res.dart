// To parse this JSON data, do
//
//     final interpolCasesRes = interpolCasesResFromJson(jsonString);

import 'dart:convert';

InterpolCasesRes interpolCasesResFromJson(String str) => InterpolCasesRes.fromJson(json.decode(str));

String interpolCasesResToJson(InterpolCasesRes data) => json.encode(data.toJson());

class InterpolCasesRes {
  InterpolCasesRes({
    this.interpolCases,
  });

  List<InterpolCase> interpolCases;

  factory InterpolCasesRes.fromJson(Map<String, dynamic> json) => InterpolCasesRes(
    interpolCases: List<InterpolCase>.from(json["Interpol Cases"].map((x) => InterpolCase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Interpol Cases": List<dynamic>.from(interpolCases.map((x) => x.toJson())),
  };
}

class InterpolCase {
  InterpolCase({
    this.id,
    this.firmCode,
    this.lawFirm,
    this.interpolCases,
  });

  int id;
  String firmCode;
  String lawFirm;
  int interpolCases;

  factory InterpolCase.fromJson(Map<String, dynamic> json) => InterpolCase(
    id: json["id"],
    firmCode: json["firm_code"],
    lawFirm: json["law_firm"],
    interpolCases: json["interpol_cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_code": firmCode,
    "law_firm": lawFirm,
    "interpol_cases": interpolCases,
  };
}
