// To parse this JSON data, do
//
//     final civilCourtProceedingDetailRes = civilCourtProceedingDetailResFromJson(jsonString);

import 'dart:convert';

CivilCourtProceedingDetailRes civilCourtProceedingDetailResFromJson(String str) => CivilCourtProceedingDetailRes.fromJson(json.decode(str));

String civilCourtProceedingDetailResToJson(CivilCourtProceedingDetailRes data) => json.encode(data.toJson());

class CivilCourtProceedingDetailRes {
  CivilCourtProceedingDetailRes({
    this.data,
  });

  Data data;

  factory CivilCourtProceedingDetailRes.fromJson(Map<String, dynamic> json) => CivilCourtProceedingDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.civilCase,
    this.lawFirm,
    this.courtName,
    this.visaIssuedDate,
    this.visaExpiryDate,
    this.travelBan,
    this.lastDateToAppeal,
    this.remarks,
    this.appealRemarks,
    this.caseNo,
    this.hearingDate,
    this.finalJudgement,
    this.caseType,
    this.hearingStatus,
    this.judgementDate,
    this.guarantorName,
    this.passport,
    this.nextHearing,
    this.hearingReminderDate,
    this.judgementRemarks,
    this.visaNo,
    this.remarksHistory,
    this.reminderMessage,
    this.appealDate,
  });

  String caseId;
  String civilCase;
  String lawFirm;
  String courtName;
  DateTime visaIssuedDate;
  DateTime visaExpiryDate;
  int travelBan;
  DateTime lastDateToAppeal;
  String remarks;
  String appealRemarks;
  String caseNo;
  DateTime hearingDate;
  String finalJudgement;
  String caseType;
  String hearingStatus;
  DateTime judgementDate;
  String guarantorName;
  String passport;
  DateTime nextHearing;
  DateTime hearingReminderDate;
  String judgementRemarks;
  String visaNo;
  List<RemarksHistory> remarksHistory;
  String reminderMessage;
  DateTime appealDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    civilCase: json["civil_case"],
    lawFirm: json["law_firm"],
    courtName: json["court_name"],
    visaIssuedDate: DateTime.parse(json["visa_issued_date"]),
    visaExpiryDate: DateTime.parse(json["visa_expiry_date"]),
    travelBan: json["travel_ban"],
    lastDateToAppeal: DateTime.parse(json["last_date_to_appeal"]),
    remarks: json["remarks"],
    appealRemarks: json["appeal_remarks"],
    caseNo: json["case_no"],
    hearingDate: DateTime.parse(json["hearing_date"]),
    finalJudgement: json["final_judgement"],
    caseType: json["case_type"],
    hearingStatus: json["hearing_status"],
    judgementDate: DateTime.parse(json["judgement_date"]),
    guarantorName: json["guarantor_name"],
    passport: json["passport"],
    nextHearing: DateTime.parse(json["next_hearing"]),
    hearingReminderDate: DateTime.parse(json["hearing_reminder_date"]),
    judgementRemarks: json["judgement_remarks"],
    visaNo: json["visa_no"],
    remarksHistory: List<RemarksHistory>.from(json["remarks_history"].map((x) => RemarksHistory.fromJson(x))),
    reminderMessage: json["reminder_message"],
    appealDate: DateTime.parse(json["appeal_date"]),
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "civil_case": civilCase,
    "law_firm": lawFirm,
    "court_name": courtName,
    "visa_issued_date": "${visaIssuedDate.year.toString().padLeft(4, '0')}-${visaIssuedDate.month.toString().padLeft(2, '0')}-${visaIssuedDate.day.toString().padLeft(2, '0')}",
    "visa_expiry_date": "${visaExpiryDate.year.toString().padLeft(4, '0')}-${visaExpiryDate.month.toString().padLeft(2, '0')}-${visaExpiryDate.day.toString().padLeft(2, '0')}",
    "travel_ban": travelBan,
    "last_date_to_appeal": "${lastDateToAppeal.year.toString().padLeft(4, '0')}-${lastDateToAppeal.month.toString().padLeft(2, '0')}-${lastDateToAppeal.day.toString().padLeft(2, '0')}",
    "remarks": remarks,
    "appeal_remarks": appealRemarks,
    "case_no": caseNo,
    "hearing_date": "${hearingDate.year.toString().padLeft(4, '0')}-${hearingDate.month.toString().padLeft(2, '0')}-${hearingDate.day.toString().padLeft(2, '0')}",
    "final_judgement": finalJudgement,
    "case_type": caseType,
    "hearing_status": hearingStatus,
    "judgement_date": "${judgementDate.year.toString().padLeft(4, '0')}-${judgementDate.month.toString().padLeft(2, '0')}-${judgementDate.day.toString().padLeft(2, '0')}",
    "guarantor_name": guarantorName,
    "passport": passport,
    "next_hearing": "${nextHearing.year.toString().padLeft(4, '0')}-${nextHearing.month.toString().padLeft(2, '0')}-${nextHearing.day.toString().padLeft(2, '0')}",
    "hearing_reminder_date": "${hearingReminderDate.year.toString().padLeft(4, '0')}-${hearingReminderDate.month.toString().padLeft(2, '0')}-${hearingReminderDate.day.toString().padLeft(2, '0')}",
    "judgement_remarks": judgementRemarks,
    "visa_no": visaNo,
    "remarks_history": List<dynamic>.from(remarksHistory.map((x) => x.toJson())),
    "reminder_message": reminderMessage,
    "appeal_date": "${appealDate.year.toString().padLeft(4, '0')}-${appealDate.month.toString().padLeft(2, '0')}-${appealDate.day.toString().padLeft(2, '0')}",
  };
}

class RemarksHistory {
  RemarksHistory({
    this.remarks,
    this.remarksDate,
    this.remarksTime,
  });

  String remarks;
  DateTime remarksDate;
  String remarksTime;

  factory RemarksHistory.fromJson(Map<String, dynamic> json) => RemarksHistory(
    remarks: json["remarks"] == null ? null : json["remarks"],
    remarksDate: DateTime.parse(json["remarks_date"]),
    remarksTime: json["remarks_time"],
  );

  Map<String, dynamic> toJson() => {
    "remarks": remarks == null ? null : remarks,
    "remarks_date": "${remarksDate.year.toString().padLeft(4, '0')}-${remarksDate.month.toString().padLeft(2, '0')}-${remarksDate.day.toString().padLeft(2, '0')}",
    "remarks_time": remarksTime,
  };
}
