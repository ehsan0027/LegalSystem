// To parse this JSON data, do
//
//     final foreignTypedCaseRes = foreignTypedCaseResFromJson(jsonString);

import 'dart:convert';

ForeignTypedCaseRes foreignTypedCaseResFromJson(String str) => ForeignTypedCaseRes.fromJson(json.decode(str));

String foreignTypedCaseResToJson(ForeignTypedCaseRes data) => json.encode(data.toJson());

class ForeignTypedCaseRes {
  ForeignTypedCaseRes({
    this.data,
  });

  Data data;

  factory ForeignTypedCaseRes.fromJson(Map<String, dynamic> json) => ForeignTypedCaseRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.firmId,
    this.civilCases,
    this.criminalCases,
  });

  int firmId;
  int civilCases;
  int criminalCases;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firmId: json["firm_id"],
    civilCases: json["civil_cases"],
    criminalCases: json["criminal_cases"],
  );

  Map<String, dynamic> toJson() => {
    "firm_id": firmId,
    "civil_cases": civilCases,
    "criminal_cases": criminalCases,
  };
}
