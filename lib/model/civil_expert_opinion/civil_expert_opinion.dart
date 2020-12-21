// To parse this JSON data, do
//
//     final civilExpertOpinionRes = civilExpertOpinionResFromJson(jsonString);

import 'dart:convert';

CivilExpertOpinionRes civilExpertOpinionResFromJson(String str) => CivilExpertOpinionRes.fromJson(json.decode(str));

String civilExpertOpinionResToJson(CivilExpertOpinionRes data) => json.encode(data.toJson());

class CivilExpertOpinionRes {
  CivilExpertOpinionRes({
    this.data,
  });

  List<Datum> data;

  factory CivilExpertOpinionRes.fromJson(Map<String, dynamic> json) => CivilExpertOpinionRes(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.caseId,
    this.caseNo,
    this.customerName,
    this.phone,
    this.passport,
    this.nationality,
    this.courtName,
  });

  int caseId;
  String caseNo;
  String customerName;
  String phone;
  String passport;
  String nationality;
  String courtName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    caseId: json["case_id"],
    caseNo: json["case_no"],
    customerName: json["customer_name"],
    phone: json["phone"],
    passport: json["passport"],
    nationality: json["nationality"],
    courtName: json["court_name"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "case_no": caseNo,
    "customer_name": customerName,
    "phone": phone,
    "passport": passport,
    "nationality": nationality,
    "court_name": courtName,
  };
}
