// To parse this JSON data, do
//
//     final pesananDikirim = pesananDikirimFromJson(jsonString);

import 'dart:convert';

PesananDikirim pesananDikirimFromJson(String str) =>
    PesananDikirim.fromJson(json.decode(str));

String pesananDikirimToJson(PesananDikirim data) => json.encode(data.toJson());

class PesananDikirim {
  PesananDikirim({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  List<Datum> data;

  factory PesananDikirim.fromJson(Map<String, dynamic> json) => PesananDikirim(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
