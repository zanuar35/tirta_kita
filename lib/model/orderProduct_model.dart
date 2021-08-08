// ignore_for_file: file_names

class OrderProductModel {
  OrderProductModel(int id, String nama, int kategoriId, String stok,
      String harga, String urlFoto) {
    this.id = id;
    this.urlFoto = urlFoto;
    this.kategoriId = kategoriId;
    this.nama = nama;
    this.harga = harga;
  }

  int id;
  String nama;
  int kategoriId;
  String stok;
  String harga;
  String urlFoto;
}
