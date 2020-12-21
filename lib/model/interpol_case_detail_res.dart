// To parse this JSON data, do
//
//     final interpolCaseDetailRes = interpolCaseDetailResFromJson(jsonString);

import 'dart:convert';

InterpolCaseDetailRes interpolCaseDetailResFromJson(String str) => InterpolCaseDetailRes.fromJson(json.decode(str));

String interpolCaseDetailResToJson(InterpolCaseDetailRes data) => json.encode(data.toJson());

class InterpolCaseDetailRes {
  InterpolCaseDetailRes({
    this.data,
  });

  Data data;

  factory InterpolCaseDetailRes.fromJson(Map<String, dynamic> json) => InterpolCaseDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.caseId,
    this.emirates,
    this.lawFirm,
    this.policeStation,
    this.criminalCaseNo,
    this.dateOfFilling,
    this.remarks,
  });

  String caseId;
  String emirates;
  String lawFirm;
  String policeStation;
  String criminalCaseNo;
  String dateOfFilling;
  String remarks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    caseId: json["case_id"],
    emirates: json["emirates"],
    lawFirm: json["law_firm"],
    policeStation: json["police_station"],
    criminalCaseNo: json["criminal_case_no"],
    dateOfFilling: json["date_of_filling"],
    remarks: json["remarks"],
  );

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "emirates": emirates,
    "law_firm": lawFirm,
    "police_station": policeStation,
    "criminal_case_no": criminalCaseNo,
    "date_of_filling": dateOfFilling,
    "remarks": remarks,
  };
}
