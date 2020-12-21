// To parse this JSON data, do
//
//     final foreignCivilCaseDetailRes = foreignCivilCaseDetailResFromJson(jsonString);

import 'dart:convert';

ForeignCivilCaseDetailRes foreignCivilCaseDetailResFromJson(String str) => ForeignCivilCaseDetailRes.fromJson(json.decode(str));

String foreignCivilCaseDetailResToJson(ForeignCivilCaseDetailRes data) => json.encode(data.toJson());

class ForeignCivilCaseDetailRes {
  ForeignCivilCaseDetailRes({
    this.data,
  });

  Data data;

  factory ForeignCivilCaseDetailRes.fromJson(Map<String, dynamic> json) => ForeignCivilCaseDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.phase,
    this.lawFirm,
    this.caseNumber,
    this.guarantorName,
    this.passportNo,
    this.visaNo,
    this.visaIssueDate,
    this.visaExpiryDate,
    this.travelBanStatus,
    this.courtName,
    this.lastDateToAppeal,
    this.hearingDate,
    this.finalJudgement,
    this.caseType,
    this.hearingStatus,
    this.judgementDate,
    this.nextHearing,
    this.reminderDate,
    this.reminder,
    this.appealDate,
    this.remarks,
    this.appealRemarks,
    this.judgementRemarks,
  });

  String caseId;
  String phase;
  String lawFirm;
  String caseNumber;
  String guarantorName;
  String passportNo;
  String visaNo;
  String visaIssueDate;
  String visaExpiryDate;
  String travelBanStatus;
  String courtName;
  String lastDateToAppeal;
  String hearingDate;
  String finalJudgement;
  String caseType;
  String hearingStatus;
  String judgementDate;
  String nextHearing;
  String reminderDate;
  String reminder;
  String appealDate;
  String remarks;
  String appealRemarks;
  String judgementRemarks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    phase: json["phase"],
    lawFirm: json["law_firm"],
    caseNumber: json["case_number"],
    guarantorName: json["guarantor_name"],
    passportNo: json["passport_no"],
    visaNo: json["visa_no"],
    visaIssueDate: json["visa_issue_date"],
    visaExpiryDate: json["visa_expiry_date"],
    travelBanStatus: json["travel_ban_status"],
    courtName: json["court_name"],
    lastDateToAppeal: json["last_date_to_appeal"],
    hearingDate: json["hearing_date"],
    finalJudgement: json["final_judgement"],
    caseType: json["case_type"],
    hearingStatus: json["hearing_status"],
    judgementDate: json["judgement_date"],
    nextHearing: json["next_hearing"],
    reminderDate: json["reminder_date"],
    reminder: json["reminder"],
    appealDate: json["appeal_date"],
    remarks: json["remarks"],
    appealRemarks: json["appeal_remarks"],
    judgementRemarks: json["judgement_remarks"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "phase": phase,
    "law_firm": lawFirm,
    "case_number": caseNumber,
    "guarantor_name": guarantorName,
    "passport_no": passportNo,
    "visa_no": visaNo,
    "visa_issue_date": visaIssueDate,
    "visa_expiry_date": visaExpiryDate,
    "travel_ban_status": travelBanStatus,
    "court_name": courtName,
    "last_date_to_appeal": lastDateToAppeal,
    "hearing_date": hearingDate,
    "final_judgement": finalJudgement,
    "case_type": caseType,
    "hearing_status": hearingStatus,
    "judgement_date": judgementDate,
    "next_hearing": nextHearing,
    "reminder_date": reminderDate,
    "reminder": reminder,
    "appeal_date": appealDate,
    "remarks": remarks,
    "appeal_remarks": appealRemarks,
    "judgement_remarks": judgementRemarks,
  };
}
