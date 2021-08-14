import 'package:flutter/material.dart';

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
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final int totalHarga;
  final String jumlah;
  final String harga;
  final String nama;
  final String urlFoto;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: blockHorizontal * 15,
                  width: blockHorizontal * 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network('$urlFoto', fit: BoxFit.fill),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$nama",
                      style: TextStyle(
                          fontSize: blockHorizontal * 3.73,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: blockVertical * 1.5),
                    Text(
                      "Jumlah : $jumlah pcs",
                      style: TextStyle(
                          fontSize: blockHorizontal * 3.73,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text("Rp $harga",
                    style: TextStyle(
                        fontSize: blockHorizontal * 3.2,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2))
              ],
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
                  "Barang telah diterima",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: blockHorizontal * 3.4,
                      color: Color(0xff3FC23D)),
                ),
                SizedBox(
                  height: blockVertical * 1,
                ),
                Text(
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
