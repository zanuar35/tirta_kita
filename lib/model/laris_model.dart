class DataLaris {
  String message;
  bool success;
  List<DataListLaris> data;

  DataLaris({this.message, this.success, this.data});

  DataLaris.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.data = (json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataListLaris.fromJson(i)).toList()
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

//  "id": 1,
//  "kategori_id": 1,
//  "kategori_nama": "Air Mineral",
//  "nama": "Aqua 350ml",
//  "foto":

class DataListLaris {
  int id;
  int kategoriId;
  String kategoriNama;
  String nama;
  String foto;

  DataListLaris(
      {this.id, this.foto, this.kategoriId, this.kategoriNama, this.nama});

  DataListLaris.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kategoriId = json['kategoriId'];
    kategoriNama = json['kategoriNama'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nama'] = nama;
    data['kategoriNama'] = kategoriNama;
    data['kategoriId'] = kategoriId;
    data['foto'] = foto;
    return data;
  }
}
