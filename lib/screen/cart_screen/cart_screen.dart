// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tirta_kita/model/orderModel.dart';
import 'package:tirta_kita/model/orderProduct_model.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/card_cart.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/option.box.dart';
import 'package:tirta_kita/screen/cart_screen/widgets/price_column.dart';
import 'package:tirta_kita/shared/widget/button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key, this.orderProduct}) : super(key: key);

  List<OrderProductModel> orderProduct;

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
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );

    int sum = 0;

    for (var i = 0; i < orderModel.length; i++) {
      sum += int.parse(orderModel[i].harga);
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 35, 24, 20),
          child: (orderModel.length == 0)
              ? Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pesanan',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "+ Tambah Pesanan",
                              style: TextStyle(
                                  color: Color(0xff276FB6),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      Center(
                        child: Text(
                          'Keranjang belanja anda masih kosong',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pesanan',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "+ Tambah Pesanan",
                            style: TextStyle(
                                color: Color(0xff276FB6),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: blockVertical * 3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: orderModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CardCart(
                                  id: index,
                                  urlFoto: orderModel[index].urlFoto,
                                  productName: orderModel[index].nama,
                                  harga: orderModel[index].harga,
                                  size: size,
                                  blockVertical: blockVertical,
                                  blockHorizontal: blockHorizontal),
                            );
                          }),
                    ),
                    SizedBox(height: 10),
                    PriceColumn(
                        hargaTotal: (orderModel.length == 0) ? '0' : 'Rp. $sum',
                        labelStyle: labelStyle,
                        priceStyle: priceStyle),
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
    ));
  }
}
