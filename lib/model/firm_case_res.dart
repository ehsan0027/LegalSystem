// To parse this JSON data, do
//
//     final firmCaseRes = firmCaseResFromJson(jsonString);

import 'dart:convert';

FirmCaseRes firmCaseResFromJson(String str) => FirmCaseRes.fromJson(json.decode(str));

String firmCaseResToJson(FirmCaseRes data) => json.encode(data.toJson());

class FirmCaseRes {
  FirmCaseRes({
    this.data,
  });

  Data data;

  factory FirmCaseRes.fromJson(Map<String, dynamic> json) => FirmCaseRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.firmId,
    this.courtProceedings,
    this.expertOpinion,
    this.judgement,
    this.execution,
    this.auction,
  });

  String firmId;
  int courtProceedings;
  int expertOpinion;
  int judgement;
  int execution;
  int auction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firmId: json["firm_id"],
    courtProceedings: json["court_proceedings"],
    expertOpinion: json["expert_opinion"],
    judgement: json["judgement"],
    execution: json["execution"],
    auction: json["auction"],
  );

  Map<String, dynamic> toJson() => {
    "firm_id": firmId,
    "court_proceedings": courtProceedings,
    "expert_opinion": expertOpinion,
    "judgement": judgement,
    "execution": execution,
    "auction": auction,
  };
}
