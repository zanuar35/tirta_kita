import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
    this.jumlahProduk,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final int jumlahProduk;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
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
            horizontal: blockHorizontal * 5, vertical: blockVertical * 1.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 26.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: jumlahProduk,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: RowProduk(
                          blockHorizontal: blockHorizontal,
                          blockVertical: blockVertical),
                    );
                  }),
            )
            // RowProduk(
            //   blockHorizontal: blockHorizontal,
            //   blockVertical: blockVertical,
            // ),
            ,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Lacak Pesanan',
                  style: TextStyle(
                      fontSize: blockHorizontal * 3.7,
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff265FAA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowProduk extends StatelessWidget {
  const RowProduk({
    Key key,
    @required this.blockHorizontal,
    @required this.blockVertical,
  }) : super(key: key);

  final double blockHorizontal;
  final double blockVertical;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              borderRadius: BorderRadius.circular(5), color: Colors.red),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
        Text(
          "Rp 50.000",
          style: TextStyle(
              fontSize: blockHorizontal * 3.4,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2),
        ),
      ],
    );
  }
}
