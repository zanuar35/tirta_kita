// To parse this JSON data, do
//
//     final ubahProfile = ubahProfileFromJson(jsonString);

import 'dart:convert';

UbahProfile ubahProfileFromJson(String str) =>
    UbahProfile.fromJson(json.decode(str));

String ubahProfileToJson(UbahProfile data) => json.encode(data.toJson());

class UbahProfile {
  UbahProfile({
    this.success,
    this.message,
  });

  bool success;
  String message;

  factory UbahProfile.fromJson(Map<String, dynamic> json) => UbahProfile(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
