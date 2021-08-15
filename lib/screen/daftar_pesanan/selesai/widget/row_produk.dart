import 'package:flutter/material.dart';

class RowProduk extends StatelessWidget {
  const RowProduk({
    Key key,
    @required this.blockHorizontal,
    @required this.urlFoto,
    @required this.nama,
    @required this.blockVertical,
    @required this.jumlah,
    @required this.harga,
  }) : super(key: key);

  final double blockHorizontal;
  final String urlFoto;
  final String nama;
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
    );
  }
}
