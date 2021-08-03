class DataProduct {
  String message;
  bool success;
  List<DataListProduct> data;

  DataProduct({this.message, this.success, this.data});

  DataProduct.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List)
            .map((i) => DataListProduct.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class DataListProduct {
  int id;
  String nama;
  int kategoriId;
  String stok;
  String harga;
  String urlFoto;

  DataListProduct(
      {this.id, this.urlFoto, this.kategoriId, this.nama, this.harga});

  DataListProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kategoriId = json['kategoriId'];
    urlFoto = json['foto'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nama'] = nama;
    data['kategoriId'] = kategoriId;
    data['harga'] = harga;
    data['foto'] = urlFoto;
    return data;
  }
}
