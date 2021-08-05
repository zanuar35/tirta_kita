// To parse this JSON data, do
//
//     final ubahProfileFailed = ubahProfileFailedFromJson(jsonString);

import 'dart:convert';

UbahProfileFailed ubahProfileFailedFromJson(String str) =>
    UbahProfileFailed.fromJson(json.decode(str));

String ubahProfileFailedToJson(UbahProfileFailed data) =>
    json.encode(data.toJson());

class UbahProfileFailed {
  UbahProfileFailed({
    this.success,
    this.message,
  });

  bool success;
  Message message;

  factory UbahProfileFailed.fromJson(Map<String, dynamic> json) =>
      UbahProfileFailed(
        success: json["success"],
        message: Message.fromJson(json["message"]),
      );

  // DataProduct.fromJson(Map<String, dynamic> json) {
  //   this.message = json['message'];
  //   this.data = (json['data'] as List) != null
  //       ? (json['data'] as List)
  //           .map((i) => DataListProduct.fromJson(i))
  //           .toList()
  //       : null;
  // }

  // UbahProfileFailed.fromJson(Map<String, dynamic> json) {
  //   this.success = json['success'];
  //   this.message = (json['message'] as List) != null
  //       ? (json['message'] as List)
  //           .map((i) => UbahProfileFailed.fromJson(i))
  //           .toList()
  //       : null;
  // }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message.toJson(),
      };
}

class Message {
  Message({
    this.email,
    this.tanggalLahir,
    this.telepon,
    this.alamat,
    this.latitude,
    this.longitude,
  });

  List<String> email;
  List<String> tanggalLahir;
  List<String> telepon;
  List<String> alamat;
  List<String> latitude;
  List<String> longitude;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        email: List<String>.from(json["email"].map((x) => x)),
        tanggalLahir: List<String>.from(json["tanggal_lahir"].map((x) => x)),
        telepon: List<String>.from(json["telepon"].map((x) => x)),
        alamat: List<String>.from(json["alamat"].map((x) => x)),
        latitude: List<String>.from(json["latitude"].map((x) => x)),
        longitude: List<String>.from(json["longitude"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email.map((x) => x)),
        "tanggal_lahir": List<dynamic>.from(tanggalLahir.map((x) => x)),
        "telepon": List<dynamic>.from(telepon.map((x) => x)),
        "alamat": List<dynamic>.from(alamat.map((x) => x)),
        "latitude": List<dynamic>.from(latitude.map((x) => x)),
        "longitude": List<dynamic>.from(longitude.map((x) => x)),
      };
}
