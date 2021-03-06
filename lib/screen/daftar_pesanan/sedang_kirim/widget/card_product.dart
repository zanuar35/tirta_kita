import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
    this.jumlahProduk,
    this.totalHarga,
    this.produk,
    this.status,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final int jumlahProduk;
  final int totalHarga;
  final List produk;
  final String status;

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
                          urlFoto: produk[index].gambar,
                          harga: produk[index].harga,
                          namaProduk: produk[index].nama,
                          jumlah: produk[index].jumlah,
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
            Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
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
                  "Rp. $totalHarga",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: blockHorizontal * 4.8),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text('Status : '),
                Text('$status',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: (status == 'dikirim')
                          ? Color(0xff00FF47)
                          : Color(0xff265FAA),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            (status == 'diproses')
                ? SizedBox(
                    width: 1,
                  )
                : Center(
                    child: InkWell(
                      onTap: () async {
                        const url = "https://www.google.com/maps/?hl=id";
                        if (await canLaunch(url))
                          await launch(url);
                        else
                          // can't launch url, there is some error
                          throw "Could not launch $url";
                      },
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
    this.namaProduk,
    this.jumlah,
    this.harga,
    this.urlFoto,
  }) : super(key: key);

  final double blockHorizontal;
  final double blockVertical;
  final String namaProduk;
  final String jumlah;
  final String harga;
  final String urlFoto;

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
              child: Image.network('$urlFoto', fit: BoxFit.fill)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$namaProduk",
              style: TextStyle(
                  fontSize: blockHorizontal * 3.73,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: blockVertical * 1.5),
            Text(
              "Jumlah : $jumlah Pcs",
              style: TextStyle(
                  fontSize: blockHorizontal * 3.73,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        Text(
          "Rp $harga",
          style: TextStyle(
              fontSize: blockHorizontal * 3.4,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2),
        ),
      ],
    );
  }
}
