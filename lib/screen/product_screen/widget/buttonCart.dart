import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/model/orderModel.dart';
import 'package:tirta_kita/model/orderProduct_model.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({
    Key key,
    @required this.orderProduct,
  }) : super(key: key);

  final List<OrderProductModel> orderProduct;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.89, 0.89),
      child: FloatingActionButton(
          child: Badge(
            animationDuration: Duration(milliseconds: 700),
            toAnimate: true,
            shape: BadgeShape.circle,
            badgeColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
            badgeContent: Text('${orderModel.length}',
                style: TextStyle(color: Colors.white)),
            child: Icon(
              LineIcons.shoppingCart,
              size: 30,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(
                  orderProduct: orderProduct,
                ),
              ),
            );
          }),
    );
  }
}
