// To parse this JSON data, do
//
//     final notificationDetailRes = notificationDetailResFromJson(jsonString);

import 'dart:convert';

NotificationDetailRes notificationDetailResFromJson(String str) => NotificationDetailRes.fromJson(json.decode(str));

String notificationDetailResToJson(NotificationDetailRes data) => json.encode(data.toJson());

class NotificationDetailRes {
  NotificationDetailRes({
    this.data,
  });

  Data data;

  factory NotificationDetailRes.fromJson(Map<String, dynamic> json) => NotificationDetailRes(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.requestId,
    this.coordinatorId,
    this.name,
    this.email,
    this.phone,
    this.passport,
    this.dateOfBirth,
    this.company,
    this.nationality,
    this.address,
    this.departmentRemarks,
    this.memo,
    this.yourRemarks,
    this.legalHeadRemarks,
    this.status,
  });

  int requestId;
  int coordinatorId;
  String name;
  String email;
  String phone;
  String passport;
  String dateOfBirth;
  String company;
  String nationality;
  String address;
  String departmentRemarks;
  String memo;
  String yourRemarks;
  String legalHeadRemarks;
  int status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    requestId: json["request_id"],
    coordinatorId: json["coordinator_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    passport: json["passport"],
    dateOfBirth: json["date_of_birth"],
    company: json["company"],
    nationality: json["nationality"],
    address: json["address"],
    departmentRemarks: json["department_remarks"],
    memo: json["memo"],
    yourRemarks: json["your_remarks"],
    legalHeadRemarks: json["legal_head_remarks"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "request_id": requestId,
    "coordinator_id": coordinatorId,
    "name": name,
    "email": email,
    "phone": phone,
    "passport": passport,
    "date_of_birth": dateOfBirth,
    "company": company,
    "nationality": nationality,
    "address": address,
    "department_remarks": departmentRemarks,
    "memo": memo,
    "your_remarks": yourRemarks,
    "legal_head_remarks": legalHeadRemarks,
    "status": status,
  };
}
