// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  Data data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.email,
    this.foto,
    this.tanggalLahir,
    this.telepon,
    this.alamat,
    this.latitude,
    this.longitude,
    this.point,
  });

  String email;
  String foto;
  DateTime tanggalLahir;
  String telepon;
  String alamat;
  String latitude;
  String longitude;
  String point;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        foto: json["foto"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        telepon: json["telepon"],
        alamat: json["alamat"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "foto": foto,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "telepon": telepon,
        "alamat": alamat,
        "latitude": latitude,
        "longitude": longitude,
        "point": point,
      };
}
