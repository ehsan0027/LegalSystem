// To parse this JSON data, do
//
//     final travelBanCaseDetailRes = travelBanCaseDetailResFromJson(jsonString);

import 'dart:convert';

TravelBanCaseDetailRes travelBanCaseDetailResFromJson(String str) => TravelBanCaseDetailRes.fromJson(json.decode(str));

String travelBanCaseDetailResToJson(TravelBanCaseDetailRes data) => json.encode(data.toJson());

class TravelBanCaseDetailRes {
  TravelBanCaseDetailRes({
    this.data,
  });

  Data data;

  factory TravelBanCaseDetailRes.fromJson(Map<String, dynamic> json) => TravelBanCaseDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.travelBanNo,
    this.travelBanFillingDate,
    this.travelBanExpiryDate,
    this.lawFirm,
    this.travelBanFillingNo,
    this.travelBanExpiryReminder,
  });

  String caseId;
  String travelBanNo;
  String travelBanFillingDate;
  String travelBanExpiryDate;
  String lawFirm;
  String travelBanFillingNo;
  String travelBanExpiryReminder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    travelBanNo: json["travel_ban_no"],
    travelBanFillingDate: json["travel_ban_filling_date"],
    travelBanExpiryDate: json["travel_ban_expiry_date"],
    lawFirm: json["law_firm"],
    travelBanFillingNo: json["travel_ban_filling_no"],
    travelBanExpiryReminder: json["travel_ban_expiry_reminder"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "travel_ban_no": travelBanNo,
    "travel_ban_filling_date": travelBanFillingDate,
    "travel_ban_expiry_date": travelBanExpiryDate,
    "law_firm": lawFirm,
    "travel_ban_filling_no": travelBanFillingNo,
    "travel_ban_expiry_reminder": travelBanExpiryReminder,
  };
}
