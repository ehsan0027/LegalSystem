// To parse this JSON data, do
//
//     final caseRes = caseResFromJson(jsonString);

import 'dart:convert';

CaseRes caseResFromJson(String str) => CaseRes.fromJson(json.decode(str));

String caseResToJson(CaseRes data) => json.encode(data.toJson());

class CaseRes {
  CaseRes({
    this.data,
  });

  List<Datum> data;

  factory CaseRes.fromJson(Map<String, dynamic> json) => CaseRes(
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
