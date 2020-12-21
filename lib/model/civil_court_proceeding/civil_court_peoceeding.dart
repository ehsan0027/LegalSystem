// To parse this JSON data, do
//
//     final civilCourtProceedingRes = civilCourtProceedingResFromJson(jsonString);

import 'dart:convert';

CivilCourtProceedingRes civilCourtProceedingResFromJson(String str) => CivilCourtProceedingRes.fromJson(json.decode(str));

String civilCourtProceedingResToJson(CivilCourtProceedingRes data) => json.encode(data.toJson());

class CivilCourtProceedingRes {
  CivilCourtProceedingRes({
    this.firms,
  });

  List<Firm> firms;

  factory CivilCourtProceedingRes.fromJson(Map<String, dynamic> json) => CivilCourtProceedingRes(
    firms: List<Firm>.from(json["Firms"].map((x) => Firm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Firms": List<dynamic>.from(firms.map((x) => x.toJson())),
  };
}

class Firm {
  Firm({
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

  factory Firm.fromJson(Map<String, dynamic> json) => Firm(
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
