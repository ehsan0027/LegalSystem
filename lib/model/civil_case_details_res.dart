// To parse this JSON data, do
//
//     final civilCaseDetailRes = civilCaseDetailResFromJson(jsonString);

import 'dart:convert';

CivilCaseDetailRes civilCaseDetailResFromJson(String str) => CivilCaseDetailRes.fromJson(json.decode(str));

String civilCaseDetailResToJson(CivilCaseDetailRes data) => json.encode(data.toJson());

class CivilCaseDetailRes {
  CivilCaseDetailRes({
    this.data,
  });

  Data data;

  factory CivilCaseDetailRes.fromJson(Map<String, dynamic> json) => CivilCaseDetailRes(
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
    this.courtName,
    this.caseNo,
    this.caseType,
    this.guarantorName,
    this.passportNo,
    this.visaNo,
    this.visaIssuedDate,
    this.visaExpiryDate,
    this.travelBan,
    this.hearingDate,
    this.hearingStatus,
    this.nextHearingDate,
    this.hearingReminderDate,
    this.reminderMessage,
    this.lastDateToAppeal,
    this.remarks,
    this.finalJudgement,
    this.judgementDate,
    this.judgementRemarks,
    this.appealDate,
    this.appealRemarks,
  });

  String caseId;
  String caseName;
  String lawFirm;
  String courtName;
  String caseNo;
  String caseType;
  String guarantorName;
  String passportNo;
  String visaNo;
  String visaIssuedDate;
  String visaExpiryDate;
  int travelBan;
  String hearingDate;
  String hearingStatus;
  String nextHearingDate;
  String hearingReminderDate;
  String reminderMessage;
  String lastDateToAppeal;
  String remarks;
  String finalJudgement;
  String judgementDate;
  String judgementRemarks;
  String appealDate;
  String appealRemarks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    caseName: json["case_name"],
    lawFirm: json["law_firm"],
    courtName: json["court_name"],
    caseNo: json["case_no"],
    caseType: json["case_type"],
    guarantorName: json["guarantor_name"],
    passportNo: json["passport_no"],
    visaNo: json["visa_no"],
    visaIssuedDate: json["visa_issued_date"],
    visaExpiryDate: json["visa_expiry_date"],
    travelBan: json["travel_ban"],
    hearingDate: json["hearing_date"],
    hearingStatus: json["hearing_status"],
    nextHearingDate: json["next_hearing_date"],
    hearingReminderDate: json["hearing_reminder_date"],
    reminderMessage: json["reminder_message"],
    lastDateToAppeal: json["last_date_to_appeal"],
    remarks: json["remarks"],
    finalJudgement: json["final_judgement"],
    judgementDate: json["judgement_date"],
    judgementRemarks: json["judgement_remarks"],
    appealDate: json["appeal_date"],
    appealRemarks: json["appeal_remarks"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "case_name": caseName,
    "law_firm": lawFirm,
    "court_name": courtName,
    "case_no": caseNo,
    "case_type": caseType,
    "guarantor_name": guarantorName,
    "passport_no": passportNo,
    "visa_no": visaNo,
    "visa_issued_date": visaIssuedDate,
    "visa_expiry_date": visaExpiryDate,
    "travel_ban": travelBan,
    "hearing_date": hearingDate,
    "hearing_status": hearingStatus,
    "next_hearing_date": nextHearingDate,
    "hearing_reminder_date": hearingReminderDate,
    "reminder_message": reminderMessage,
    "last_date_to_appeal": lastDateToAppeal,
    "remarks": remarks,
    "final_judgement": finalJudgement,
    "judgement_date": judgementDate,
    "judgement_remarks": judgementRemarks,
    "appeal_date": appealDate,
    "appeal_remarks": appealRemarks,
  };
}
