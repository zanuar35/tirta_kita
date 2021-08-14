import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/pesanan_selesai_model.dart';
import 'package:tirta_kita/screen/daftar_pesanan/selesai/widget/card_product.dart';
import 'package:http/http.dart' as http;

class SelesaiKirim extends StatefulWidget {
  //const SelesaiKirim({ Key? key }) : super(key: key);

  @override
  State<SelesaiKirim> createState() => _SelesaiKirimState();
}

class _SelesaiKirimState extends State<SelesaiKirim> {
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
        apiPesananSelesai();
      });
    });
  }

  List pesanan;
  PesananSelesai pesananSelesai;

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
                            urlFoto: pesanan[index].produk[0].gambar,
                            harga: pesanan[index].produk[0].harga,
                            size: size,
                            nama: pesanan[index].produk[0].nama,
                            jumlah: pesanan[index].produk[0].jumlah,
                            blockVertical: blockVertical,
                            blockHorizontal: blockHorizontal,
                            totalHarga: pesanan[index].total),
                      );
                    })));
  }

  Future<PesananSelesai> apiPesananSelesai() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/pesanan/selesai"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    PesananSelesai pesananSelesai = PesananSelesai.fromJson(parsed);

    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        pesanan = pesananSelesai.data;
        pesananSelesai = pesananSelesai;
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

    return pesananSelesai;
  }
}
