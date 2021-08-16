import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowProduk extends StatelessWidget {
  const RowProduk({
    Key key,
    @required this.blockHorizontal,
    @required this.urlProduk,
    @required this.namaProduk,
    @required this.blockVertical,
    @required this.jumlah,
    @required this.harga,
  }) : super(key: key);

  final double blockHorizontal;
  final String urlProduk;
  final String namaProduk;
  final double blockVertical;
  final String jumlah;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: blockHorizontal * 15,
            width: blockHorizontal * 15,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network('$urlProduk', fit: BoxFit.fill))),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              namaProduk,
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
        Text(
          'Rp. $harga',
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: blockHorizontal * 3.4,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2),
          ),
        )
      ],
    );
  }
}
