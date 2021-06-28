

import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/daftar_pesanan/selesai/widget/card_product.dart';

class SelesaiKirim extends StatelessWidget {
  //const SelesaiKirim({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(blockVertical * 3),
            width: size.width / 1,
            height: blockVertical * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CardProduct(
                    size: size,
                    blockVertical: blockVertical,
                    blockHorizontal: blockHorizontal),
                SizedBox(
                  height: blockVertical * 2,
                ),
              ],
            ),
          ),
        ));
  }
}
