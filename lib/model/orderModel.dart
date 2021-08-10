// ignore_for_file: file_names

class OrderModel {
  OrderModel(int id, int jumlah, String payment, String nama, int kategoriId,
      String stok, String harga, String urlFoto) {
    this.jumlah = jumlah;
    this.payment = payment;
    this.id = id;
    this.urlFoto = urlFoto;
    this.kategoriId = kategoriId;
    this.nama = nama;
    this.harga = harga;
  }

  int id;
  String payment;
  int jumlah;
  String nama;
  int kategoriId;
  String stok;
  String harga;
  String urlFoto;
}

List<OrderModel> orderModel = [];
