import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/card_cart.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/option.box.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/price_column.dart';
import 'package:tirta_kita/shared/widget/button.dart';

class CartScreen extends StatefulWidget {
  //const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    final TextStyle labelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    final TextStyle priceStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              width: blockVertical * 100,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: blockVertical * 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff2879BD), Color(0xff298DCC)],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight),
                    ),
                  ),
                  Positioned(
                    top: blockVertical * 15,
                    child: Container(
                      width: size.width,
                      height: blockVertical * 85,
                      decoration: BoxDecoration(
                        color: Color(0xfffffffd),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(24, 35, 24, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Pesanan',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+ Tambah Pesanan",
                                  style: TextStyle(
                                      color: Color(0xff276FB6),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: blockVertical * 3,
                            ),
                            CardCart(
                                size: size,
                                blockVertical: blockVertical,
                                blockHorizontal: blockHorizontal),
                            SizedBox(
                              height: 20,
                            ),
                            CardCart(
                                size: size,
                                blockVertical: blockVertical,
                                blockHorizontal: blockHorizontal),
                            SizedBox(
                              height: 20,
                            ),
                            PriceColumn(
                                labelStyle: labelStyle, priceStyle: priceStyle),
                            SizedBox(
                              height: 20,
                            ),
                            OptionBox(
                                size: size,
                                blockVertical: blockVertical,
                                blockHorizontal: blockHorizontal),
                            SizedBox(height: 15),
                            Button(
                              text: 'Konfirmasi Pembelian',
                              color: Color(0xff2BBAEC),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
