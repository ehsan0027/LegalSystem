// To parse this JSON data, do
//
//     final criminalCaseDetailRes = criminalCaseDetailResFromJson(jsonString);

import 'dart:convert';

CriminalCaseDetailRes criminalCaseDetailResFromJson(String str) => CriminalCaseDetailRes.fromJson(json.decode(str));

String criminalCaseDetailResToJson(CriminalCaseDetailRes data) => json.encode(data.toJson());

class CriminalCaseDetailRes {
  CriminalCaseDetailRes({
    this.data,
  });

  Data data;

  factory CriminalCaseDetailRes.fromJson(Map<String, dynamic> json) => CriminalCaseDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.caseName,
    this.lawFirm,
    this.criminalCaseNo,
    this.emirates,
    this.policeStation,
    this.fillingDate,
    this.customerName,
    this.chequeNo,
    this.chequeDate,
    this.chequeAmount,
    this.drawerBank,
    this.chequeStatus,
    this.courtName,
    this.nextHearingDate,
    this.hearingStatus,
    this.criminalProcess,
    this.criminalCaseStatus,
    this.hearingReminderDate,
    this.remarks,
    this.judgementDate,
    this.judgementRemarks,
    this.appealDate,
    this.appealRemarks,
  });

  String caseId;
  String caseName;
  String lawFirm;
  String criminalCaseNo;
  String emirates;
  String policeStation;
  String fillingDate;
  String customerName;
  String chequeNo;
  String chequeDate;
  String chequeAmount;
  String drawerBank;
  String chequeStatus;
  String courtName;
  String nextHearingDate;
  String hearingStatus;
  String criminalProcess;
  String criminalCaseStatus;
  String hearingReminderDate;
  String remarks;
  String judgementDate;
  String judgementRemarks;
  String appealDate;
  String appealRemarks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    caseName: json["case_name"],
    lawFirm: json["law_firm"],
    criminalCaseNo: json["criminal_case_no"],
    emirates: json["emirates"],
    policeStation: json["police_station"],
    fillingDate: json["filling_date"],
    customerName: json["customer_name"],
    chequeNo: json["cheque_no"],
    chequeDate: json["cheque_date"],
    chequeAmount: json["cheque_amount"],
    drawerBank: json["drawer_bank"],
    chequeStatus: json["cheque_status"],
    courtName: json["court_name"],
    nextHearingDate: json["next_hearing_date"],
    hearingStatus: json["hearing_status"],
    criminalProcess: json["criminal_process"],
    criminalCaseStatus: json["criminal_case_status"],
    hearingReminderDate: json["hearing_reminder_date"],
    remarks: json["remarks"],
    judgementDate: json["judgement_date"],
    judgementRemarks: json["judgement_remarks"],
    appealDate: json["appeal_date"],
    appealRemarks: json["appeal_remarks"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "case_name": caseName,
    "law_firm": lawFirm,
    "criminal_case_no": criminalCaseNo,
    "emirates": emirates,
    "police_station": policeStation,
    "filling_date": fillingDate,
    "customer_name": customerName,
    "cheque_no": chequeNo,
    "cheque_date": chequeDate,
    "cheque_amount": chequeAmount,
    "drawer_bank": drawerBank,
    "cheque_status": chequeStatus,
    "court_name": courtName,
    "next_hearing_date": nextHearingDate,
    "hearing_status": hearingStatus,
    "criminal_process": criminalProcess,
    "criminal_case_status": criminalCaseStatus,
    "hearing_reminder_date": hearingReminderDate,
    "remarks": remarks,
    "judgement_date": judgementDate,
    "judgement_remarks": judgementRemarks,
    "appeal_date": appealDate,
    "appeal_remarks": appealRemarks,
  };
}
