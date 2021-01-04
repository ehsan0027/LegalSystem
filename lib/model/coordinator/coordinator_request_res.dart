// To parse this JSON data, do
//
//     final coordinatorRequestsRes = coordinatorRequestsResFromJson(jsonString);

import 'dart:convert';

CoordinatorRequestsRes coordinatorRequestsResFromJson(String str) => CoordinatorRequestsRes.fromJson(json.decode(str));

String coordinatorRequestsResToJson(CoordinatorRequestsRes data) => json.encode(data.toJson());

class CoordinatorRequestsRes {
  CoordinatorRequestsRes({
    this.data,
  });

  List<Datum> data;

  factory CoordinatorRequestsRes.fromJson(Map<String, dynamic> json) => CoordinatorRequestsRes(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.historyId,
    this.srNo,
    this.customerName,
    this.mobileNumber,
    this.accountNo,
    this.passportNo,
    this.nationality,
    this.submitId,
    this.assignedId,
    this.remarks,
    this.status,
  });

  int id;
  int historyId;
  int srNo;
  String customerName;
  String mobileNumber;
  String accountNo;
  String passportNo;
  String nationality;
  String submitId;
  String assignedId;
  String remarks;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    historyId: json["history_id"],
    srNo: json["sr_no"],
    customerName: json["customer_name"],
    mobileNumber: json["mobile_number"],
    accountNo: json["account_no"],
    passportNo: json["passport_no"],
    nationality: json["nationality"],
    submitId: json["submit_id"],
    assignedId: json["assigned_id"],
    remarks: json["remarks"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "history_id": historyId,
    "sr_no": srNo,
    "customer_name": customerName,
    "mobile_number": mobileNumber,
    "account_no": accountNo,
    "passport_no": passportNo,
    "nationality": nationality,
    "submit_id": submitId,
    "assigned_id": assignedId,
    "remarks": remarks,
    "status": status,
  };
}
