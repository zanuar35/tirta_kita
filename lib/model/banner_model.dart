import 'dart:convert';

Databanner databannerFromJson(String str) =>
    Databanner.fromJson(json.decode(str));

String databannerToJson(Databanner data) => json.encode(data.toJson());

class Databanner {
  Databanner({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<DataListBanner> data;

  Databanner.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = ((json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataListBanner.fromJson(i)).toList()
        : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class DataListBanner {
  DataListBanner({
    this.id,
    this.nama,
    this.banner,
  });

  int id;
  String nama;
  String banner;

  factory DataListBanner.fromJson(Map<String, dynamic> json) => DataListBanner(
        id: json["id"],
        nama: json["nama"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "banner": banner,
      };
}
