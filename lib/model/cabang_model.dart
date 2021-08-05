import 'dart:convert';

DataCabang dataCabangFromJson(String str) =>
    DataCabang.fromJson(json.decode(str));

String dataCabangToJson(DataCabang data) => json.encode(data.toJson());

class DataCabang {
  DataCabang({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<DataListCabang> data;

  DataCabang.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = ((json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataListCabang.fromJson(i)).toList()
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

class DataListCabang {
  DataListCabang({
    this.id,
    this.nama,
    this.alamat,
    this.latitude,
    this.longitude,
    this.jarak,
    this.harga,
    this.foto,
  });

  int id;
  String nama;
  String alamat;
  String latitude;
  String longitude;
  String jarak;
  int harga;
  String foto;

  factory DataListCabang.fromJson(Map<String, dynamic> json) => DataListCabang(
        id: json["id"],
        nama: json["nama"],
        alamat: json["alamat"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        jarak: json["jarak"],
        harga: json["harga"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "alamat": alamat,
        "latitude": latitude,
        "longitude": longitude,
        "jarak": jarak,
        "harga": harga,
        "foto": foto,
      };
}
