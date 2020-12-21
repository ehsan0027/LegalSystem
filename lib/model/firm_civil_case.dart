// To parse this JSON data, do
//
//     final firmCivilCaseRes = firmCivilCaseResFromJson(jsonString);

import 'dart:convert';

FirmCivilCaseRes firmCivilCaseResFromJson(String str) => FirmCivilCaseRes.fromJson(json.decode(str));

String firmCivilCaseResToJson(FirmCivilCaseRes data) => json.encode(data.toJson());

class FirmCivilCaseRes {
  FirmCivilCaseRes({
    this.civil,
  });

  Civil civil;

  factory FirmCivilCaseRes.fromJson(Map<String, dynamic> json) => FirmCivilCaseRes(
    civil: Civil.fromJson(json["Civil"]),
  );

  Map<String, dynamic> toJson() => {
    "Civil": civil.toJson(),
  };
}

class Civil {
  Civil({
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

  factory Civil.fromJson(Map<String, dynamic> json) => Civil(
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
