import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/pesanan_dikirim_model.dart';
import 'package:tirta_kita/screen/daftar_pesanan/sedang_kirim/widget/card_product.dart';

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
        // call api
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
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CardProduct(
                  jumlahProduk: (index.isEven) ? 1 : 2,
                  size: size,
                  blockVertical: blockVertical,
                  blockHorizontal: blockHorizontal),
            );
          },
        ),
      ),
    );
  }
}
