// To parse this JSON data, do
//
//     final loginRes = loginResFromJson(jsonString);

import 'dart:convert';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
  LoginRes({
    this.success,
  });

  Success success;

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
    success: Success.fromJson(json["success"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success.toJson(),
  };
}

class Success {
  Success({
    this.token,
    this.name,
    this.role,
  });

  String token;
  String name;
  String role;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
    token: json["token"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "role": role,
  };
}
