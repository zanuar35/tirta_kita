import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/pesanan_baru_model.dart';
import 'package:http/http.dart' as http;
import 'package:tirta_kita/screen/konfirmasi_pembayaran/konfirmasi_pembayaran.dart';

class BelumBayar extends StatefulWidget {
  //const BelumBayar({ Key? key }) : super(key: key);

  @override
  State<BelumBayar> createState() => _BelumBayarState();
}

class _BelumBayarState extends State<BelumBayar> {
  String token = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        apiPesananBaru();
      });
    });
  }

  List pesanan;
  PesananBaru pesananBaru;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        margin: EdgeInsets.all(blockHorizontal * 6),
        width: size.width / 1,
        child: (pesanan == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pesanan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CardOrderProduct(
                        produk: pesanan[index].produk,
                        i: index,
                        invoice: pesanan[index].invoice,
                        status: pesanan[index].status,
                        jumlahProduk: pesanan[index].produk.length,
                        subTotal: pesanan[index].subtotal,
                        totalBayar: pesanan[index].total,
                        ongkir: pesanan[index].ongkir,
                        promo: pesanan[index].promo,
                        size: size,
                        blockVertical: blockVertical,
                        blockHorizontal: blockHorizontal),
                  );
                },
              ),
      ),
    );
  }

  Future<PesananBaru> apiPesananBaru() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/pesanan/baru"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    PesananBaru pesananBaru = PesananBaru.fromJson(parsed);

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        pesanan = pesananBaru.data;
        pesananBaru = pesananBaru;
        setState(() {});
      }
      for (var i = 0; i < pesanan.length; i++) {
        print(pesanan[i].id);
        print(pesanan[i].invoice);
        print(pesanan[i].ongkir);
        print(pesanan[i].total);
        print(pesanan[i].produk[0].nama);
        print('\n');
      }
    }

    return pesananBaru;
  }
}

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
                                    builder: (context) =>
                                        KonfirmasiPembayaran()));
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
