import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/pesanan_dikirim_model.dart';
import 'package:tirta_kita/screen/daftar_pesanan/sedang_kirim/widget/card_product.dart';
import 'package:http/http.dart' as http;

class SedangKirim extends StatefulWidget {
  //const SedangKirim({ Key? key }) : super(key: key);

  @override
  State<SedangKirim> createState() => _SedangKirimState();
}

class _SedangKirimState extends State<SedangKirim> {
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
        apiPesananDikirim();
      });
    });
  }

  List pesanan;
  PesananDikirim pesananDikirim;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        margin: EdgeInsets.fromLTRB(24, 10, 24, 5),
        width: size.width / 1,
        child: (pesanan == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: pesanan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CardProduct(
                        produk: pesanan[index].produk,
                        jumlahProduk: pesanan[index].produk.length,
                        size: size,
                        status: pesanan[index].status,
                        totalHarga: pesanan[index].total,
                        blockVertical: blockVertical,
                        blockHorizontal: blockHorizontal),
                  );
                },
              ),
      ),
    );
  }

  Future<PesananDikirim> apiPesananDikirim() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/pesanan/dikirim"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    PesananDikirim pesananDikirim = PesananDikirim.fromJson(parsed);

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        pesanan = pesananDikirim.data;
        pesananDikirim = pesananDikirim;
        for (var i = 0; i < pesanan.length; i++) {
          print(pesanan[i].id);
          print(pesanan[i].status);
        }
        setState(() {});
      }
    }

    return pesananDikirim;
  }
}
