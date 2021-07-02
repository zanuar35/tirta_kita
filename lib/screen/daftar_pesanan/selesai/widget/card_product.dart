import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
    @required this.size,
    @required this.blockVertical,
    @required this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
      height: blockVertical * 24,
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
                  child: Image(
                    image: NetworkImage(
                      'https://i.ibb.co/NsYWbNM/Rectangle-117.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Beras Rojo Lele 5 kg",
                      style: TextStyle(
                          fontSize: blockHorizontal * 3.73,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: blockVertical * 1.5),
                    Text(
                      "Jumlah : 2 Pcs",
                      style: TextStyle(
                          fontSize: blockHorizontal * 3.73,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text("Rp 50.000",
                    style: TextStyle(
                        fontSize: blockHorizontal * 3.2,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2))
              ],
            ),
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
                  "Rp. 100.000",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: blockHorizontal * 4.8),
                ),
              ],
            ),
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
