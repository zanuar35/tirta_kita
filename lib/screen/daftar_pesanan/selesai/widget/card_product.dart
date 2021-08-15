import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/daftar_pesanan/selesai/widget/row_produk.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
    this.totalHarga,
    this.jumlah,
    this.harga,
    this.nama,
    this.urlFoto,
    this.jumlahProduk,
    this.produk,
    this.status,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final int totalHarga;
  final String jumlah;
  final String harga;
  final String nama;
  final int jumlahProduk;
  final String urlFoto;
  final List produk;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xfffdfdfd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 8), // changes position of shadow
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: blockHorizontal * 5, vertical: blockVertical * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 800, minHeight: 26.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: jumlahProduk,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: RowProduk(
                        blockHorizontal: blockHorizontal,
                        urlFoto: produk[index].gambar,
                        nama: produk[index].nama,
                        blockVertical: blockVertical,
                        jumlah: produk[index].jumlah,
                        harga: produk[index].harga,
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Total Bayar :",
                  style: TextStyle(
                      fontSize: blockHorizontal * 3.73,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Rp. $totalHarga",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: blockHorizontal * 4.8),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  (status == 'selesai')
                      ? "Pesanan ditolak"
                      : "Barang telah diterima",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: blockHorizontal * 3.4,
                      color: (status == 'selesai')
                          ? Colors.red
                          : Color(0xff3FC23D)),
                ),
                SizedBox(
                  height: blockVertical * 1,
                ),
                (status == 'selesai')
                    ? SizedBox(height: 1)
                    : Text(
                        "Anda mendapat 20 poin",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: blockHorizontal * 3.75),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
