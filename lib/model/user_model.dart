// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
     this.success,
     this.message,
     this.data,
     this.token,
  });

  bool success;
  String message;
  Data data;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class Data {
  Data({
     this.nama,
     this.email,
    this.foto,
    this.point,
  });

  String nama;
  String email;
  dynamic foto;
  dynamic point;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        email: json["email"],
        foto: json["foto"],
        point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "foto": foto,
        "point": point,
      };
}
