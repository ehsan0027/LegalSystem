// To parse this JSON data, do
//
//     final travelBanRes = travelBanResFromJson(jsonString);

import 'dart:convert';

TravelBanRes travelBanResFromJson(String str) => TravelBanRes.fromJson(json.decode(str));

String travelBanResToJson(TravelBanRes data) => json.encode(data.toJson());

class TravelBanRes {
  TravelBanRes({
    this.travelBanCases,
  });

  List<TravelBanCase> travelBanCases;

  factory TravelBanRes.fromJson(Map<String, dynamic> json) => TravelBanRes(
    travelBanCases: List<TravelBanCase>.from(json["Travel Ban Cases"].map((x) => TravelBanCase.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Travel Ban Cases": List<dynamic>.from(travelBanCases.map((x) => x.toJson())),
  };
}

class TravelBanCase {
  TravelBanCase({
    this.id,
    this.firmCode,
    this.lawFirm,
    this.travelBanCases,
  });

  int id;
  String firmCode;
  String lawFirm;
  int travelBanCases;

  factory TravelBanCase.fromJson(Map<String, dynamic> json) => TravelBanCase(
    id: json["id"],
    firmCode: json["firm_code"],
    lawFirm: json["law_firm"],
    travelBanCases: json["travel_ban_cases"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firm_code": firmCode,
    "law_firm": lawFirm,
    "travel_ban_cases": travelBanCases,
  };
}
