// To parse this JSON data, do
//
//     final pesananSelesai = pesananSelesaiFromJson(jsonString);

import 'dart:convert';

PesananSelesai pesananSelesaiFromJson(String str) =>
    PesananSelesai.fromJson(json.decode(str));

String pesananSelesaiToJson(PesananSelesai data) => json.encode(data.toJson());

class PesananSelesai {
  PesananSelesai({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<DataListPesananSelesai> data;

  PesananSelesai.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List)
            .map((i) => DataListPesananSelesai.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataListPesananSelesai {
  DataListPesananSelesai({
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

  factory DataListPesananSelesai.fromJson(Map<String, dynamic> json) =>
      DataListPesananSelesai(
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
