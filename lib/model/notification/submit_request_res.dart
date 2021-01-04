// To parse this JSON data, do
//
//     final submitRequestRes = submitRequestResFromJson(jsonString);

import 'dart:convert';

SubmitRequestRes submitRequestResFromJson(String str) => SubmitRequestRes.fromJson(json.decode(str));

String submitRequestResToJson(SubmitRequestRes data) => json.encode(data.toJson());

class SubmitRequestRes {
  SubmitRequestRes({
    this.message,
  });

  String message;

  factory SubmitRequestRes.fromJson(Map<String, dynamic> json) => SubmitRequestRes(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
