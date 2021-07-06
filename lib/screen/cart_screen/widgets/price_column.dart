import 'package:flutter/material.dart';

class PriceColumn extends StatelessWidget {
  const PriceColumn({
    Key? key,
    required this.labelStyle,
    required this.priceStyle,
  }) : super(key: key);

  final TextStyle labelStyle;
  final TextStyle priceStyle;

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
                'Rp 48.000',
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
                'Rp 53.000',
                style: priceStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
