class DataKategori {
  String message;
  bool success;
  List<DataListKategori> data;

  DataKategori({this.message, this.success, this.data});

  DataKategori.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = ((json['data'] as List) != null
        ? (json['data'] as List)
            .map((i) => DataListKategori.fromJson(i))
            .toList()
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

class DataListKategori {
  int id;
  String nama;
  String gambar;

  DataListKategori({this.id, this.gambar, this.nama});

  DataListKategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nama'] = nama;
    data['gambar'] = gambar;
    return data;
  }
}
