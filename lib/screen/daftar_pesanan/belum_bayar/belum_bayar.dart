import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/pesanan_baru_model.dart';
import 'package:http/http.dart' as http;
import 'package:tirta_kita/screen/daftar_pesanan/belum_bayar/widgets/cardProduk.dart';

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


