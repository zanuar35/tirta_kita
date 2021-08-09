import 'package:flutter/material.dart';
import 'package:tirta_kita/blocs/totalHarga.dart';

class PriceColumn extends StatelessWidget {
  PriceColumn({
    this.hargaTotal,
    Key key,
    this.labelStyle,
    this.priceStyle,
  }) : super(key: key);

  final TextStyle labelStyle;
  final TextStyle priceStyle;
  final String hargaTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subtotal',
                style: labelStyle,
              ),
              Text(
                hargaTotal,
                style: priceStyle,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ongkir',
                style: labelStyle,
              ),
              Text(
                'Rp 5.000',
                style: priceStyle,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: labelStyle,
              ),
              Text(
                hargaTotal,
                style: priceStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
