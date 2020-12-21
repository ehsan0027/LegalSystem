// To parse this JSON data, do
//
//     final foreignCriminalCaseDetailRes = foreignCriminalCaseDetailResFromJson(jsonString);

import 'dart:convert';

ForeignCriminalCaseDetailRes foreignCriminalCaseDetailResFromJson(String str) => ForeignCriminalCaseDetailRes.fromJson(json.decode(str));

String foreignCriminalCaseDetailResToJson(ForeignCriminalCaseDetailRes data) => json.encode(data.toJson());

class ForeignCriminalCaseDetailRes {
  ForeignCriminalCaseDetailRes({
    this.data,
  });

  Data data;

  factory ForeignCriminalCaseDetailRes.fromJson(Map<String, dynamic> json) => ForeignCriminalCaseDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.lawFirm,
    this.caseNumber,
    this.fillingDate,
    this.customerName,
    this.chequeNo,
    this.chequeDate,
    this.chequeAmount,
    this.drawerBank,
    this.chequeStatus,
    this.hearingDate,
    this.caseStatus,
    this.reminderDate,
    this.phase,
    this.judgementDate,
    this.emirates,
    this.station,
    this.courtName,
    this.hearingStatus,
    this.appealDate,
    this.criminalProcess,
    this.remarks,
    this.judgementRemarks,
    this.appealRemarks,
  });

  String caseId;
  String lawFirm;
  String caseNumber;
  String fillingDate;
  String customerName;
  String chequeNo;
  String chequeDate;
  String chequeAmount;
  String drawerBank;
  String chequeStatus;
  String hearingDate;
  String caseStatus;
  String reminderDate;
  String phase;
  String judgementDate;
  String emirates;
  String station;
  String courtName;
  String hearingStatus;
  String appealDate;
  String criminalProcess;
  String remarks;
  String judgementRemarks;
  String appealRemarks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    lawFirm: json["law_firm"],
    caseNumber: json["case_number"],
    fillingDate: json["filling_date"],
    customerName: json["customer_name"],
    chequeNo: json["cheque_no"],
    chequeDate: json["cheque_date"],
    chequeAmount: json["cheque_amount"],
    drawerBank: json["drawer_bank"],
    chequeStatus: json["cheque_status"],
    hearingDate: json["hearing_date"],
    caseStatus: json["case_status"],
    reminderDate: json["reminder_date"],
    phase: json["phase"],
    judgementDate: json["judgement_date"],
    emirates: json["emirates"],
    station: json["station"],
    courtName: json["court_name"],
    hearingStatus: json["hearing_status"],
    appealDate: json["appeal_date"],
    criminalProcess: json["criminal_process"],
    remarks: json["remarks"],
    judgementRemarks: json["judgement_remarks"],
    appealRemarks: json["appeal_remarks"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "law_firm": lawFirm,
    "case_number": caseNumber,
    "filling_date": fillingDate,
    "customer_name": customerName,
    "cheque_no": chequeNo,
    "cheque_date": chequeDate,
    "cheque_amount": chequeAmount,
    "drawer_bank": drawerBank,
    "cheque_status": chequeStatus,
    "hearing_date": hearingDate,
    "case_status": caseStatus,
    "reminder_date": reminderDate,
    "phase": phase,
    "judgement_date": judgementDate,
    "emirates": emirates,
    "station": station,
    "court_name": courtName,
    "hearing_status": hearingStatus,
    "appeal_date": appealDate,
    "criminal_process": criminalProcess,
    "remarks": remarks,
    "judgement_remarks": judgementRemarks,
    "appeal_remarks": appealRemarks,
  };
}
