// To parse this JSON data, do
//
//     final foreignCasesRes = foreignCasesResFromJson(jsonString);

import 'dart:convert';

ForeignCasesRes foreignCasesResFromJson(String str) => ForeignCasesRes.fromJson(json.decode(str));

String foreignCasesResToJson(ForeignCasesRes data) => json.encode(data.toJson());

class ForeignCasesRes {
  ForeignCasesRes({
    this.data,
  });

  List<Datum> data;

  factory ForeignCasesRes.fromJson(Map<String, dynamic> json) => ForeignCasesRes(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.firmId,
    this.firmCode,
    this.lawFirm,
    this.totalForeignCases,
  });

  int firmId;
  String firmCode;
  String lawFirm;
  int totalForeignCases;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    firmId: json["firm_id"],
    firmCode: json["firm_code"],
    lawFirm: json["law_firm"],
    totalForeignCases: json["total_foreign_cases"],
  );

  Map<String, dynamic> toJson() => {
    "firm_id": firmId,
    "firm_code": firmCode,
    "law_firm": lawFirm,
    "total_foreign_cases": totalForeignCases,
  };
}
