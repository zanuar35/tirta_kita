// To parse this JSON data, do
//
//     final pesananBaru = pesananBaruFromJson(jsonString);

import 'dart:convert';

PesananBaru pesananBaruFromJson(String str) =>
    PesananBaru.fromJson(json.decode(str));

String pesananBaruToJson(PesananBaru data) => json.encode(data.toJson());

class PesananBaru {
  PesananBaru({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<DataListPesananBaru> data;

  PesananBaru.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List)
            .map((i) => DataListPesananBaru.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] =
        this.data != null ? this.data.map((e) => e.toJson()).toList() : null;
    return data;
  }

}

class DataListPesananBaru {
  DataListPesananBaru({
    this.id,
    this.invoice,
    this.status,
    this.subtotal,
    this.ongkir,
    this.promo,
    this.total,
    this.produk,
  });

  int id;
  String invoice;
  String status;
  int subtotal;
  String ongkir;
  String promo;
  int total;
  List<Produk> produk;

  factory DataListPesananBaru.fromJson(Map<String, dynamic> json) =>
      DataListPesananBaru(
        id: json["id"],
        invoice: json["invoice"],
        status: json["status"],
        subtotal: json["subtotal"],
        ongkir: json["ongkir"],
        promo: json["promo"] == null ? null : json["promo"],
        total: json["total"],
        produk:
            List<Produk>.from(json["produk"].map((x) => Produk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice": invoice,
        "status": status,
        "subtotal": subtotal,
        "ongkir": ongkir,
        "promo": promo == null ? null : promo,
        "total": total,
        "produk": List<dynamic>.from(produk.map((x) => x.toJson())),
      };
}

class Produk {
  Produk({
    this.nama,
    this.jumlah,
    this.harga,
    this.gambar,
  });

  String nama;
  String jumlah;
  String harga;
  String gambar;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        nama: json["nama"],
        jumlah: json["jumlah"],
        harga: json["harga"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jumlah": jumlah,
        "harga": harga,
        "gambar": gambar,
      };
}
