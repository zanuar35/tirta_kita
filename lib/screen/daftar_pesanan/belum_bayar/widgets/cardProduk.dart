import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/daftar_pesanan/belum_bayar/widgets/rowProduk.dart';
import 'package:tirta_kita/screen/konfirmasi_pembayaran/konfirmasi_pembayaran.dart';

class CardOrderProduct extends StatelessWidget {
  const CardOrderProduct({
    Key key,
    @required this.size,
    @required this.blockVertical,
    @required this.blockHorizontal,
    this.totalBayar,
    this.ongkir,
    this.promo,
    this.subTotal,
    this.jumlahProduk,
    this.urlProduk,
    this.i,
    this.produk,
    this.status,
    this.invoice,
    this.id,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final String urlProduk;
  final int i;
  final List produk;
  final int totalBayar;
  final String ongkir;
  final String promo;
  final int subTotal;
  final String status;
  final int jumlahProduk;
  final String invoice;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
      //height: blockVertical * 23,
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
            horizontal: blockHorizontal * 5, vertical: blockVertical * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200, minHeight: 26.0),
              // height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: jumlahProduk,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RowProduk(
                      blockHorizontal: blockHorizontal,
                      urlProduk: produk[index].gambar,
                      namaProduk: produk[index].nama,
                      blockVertical: blockVertical,
                      jumlah: produk[index].jumlah,
                      harga: produk[index].harga,
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            Text('$invoice',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sub Total           :'),
                Text('Rp. $subTotal')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Ongkir                :'),
                Text((ongkir == null || ongkir == '0') ? '-' : 'Rp. $ongkir')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Diskon Promo  :'),
                Text((promo == null || promo == '0') ? '-' : ' Rp. $promo')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Bayar       :'),
                Text('Rp. $totalBayar',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text('Status : '),
                Text('$status',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: (status == 'dikonfirmasi')
                          ? Color(0xff00FF47)
                          : Color(0xff265FAA),
                    ))
              ],
            ),
            (status == 'baru')
                ? Column(
                    children: [
                      Divider(
                        height: 20,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KonfirmasiPembayaran(
                                          id: id,
                                        )));
                          },
                          child: Text(
                            'Konfirmasi Pembayaran',
                            style: TextStyle(
                                fontSize: blockHorizontal * 3.7,
                                letterSpacing: 0.7,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff265FAA)),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: 1,
                  )
          ],
        ),
      ),
    );
  }
}
