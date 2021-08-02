import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tirta_kita/screen/home_screen/widgets/card_product.dart';

class ShimmerCardProduk extends StatelessWidget {
  const ShimmerCardProduk({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey[200],
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardProductHome(
                url: '',
                namaProduk: '',
              ),
              CardProductHome(
                url: '',
                namaProduk: '',
              )
            ],
          ),
        ),
      ),
    );
  }
}
