import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/blocs/paymentMethod.dart';
import 'package:tirta_kita/model/orderModel.dart';
import 'package:tirta_kita/screen/pakai_promo/pakai_promo.dart';
import 'package:tirta_kita/screen/payment_method/metode_pembayaran.dart';

class OptionBox extends StatefulWidget {
  OptionBox({
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  PaymentBloc blocs = PaymentBloc();

  void initState() {
    super.initState();
  }

  String payment;

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    payment = prefs.getString('payment');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width / 1,
      height: widget.blockVertical * 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2, color: Colors.grey),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(widget.blockVertical * 1.2),
            width: widget.blockHorizontal * 35,
            height: widget.size.height / 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Pakai Promo',
                      style: TextStyle(
                          fontSize: widget.blockHorizontal * 3.7,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'DISC 123',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: widget.blockHorizontal * 3.7),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PakaiPromo()));
                    },
                    child: Icon(LineIcons.angleRight))
              ],
            ),
          ),
          VerticalDivider(
            color: Colors.grey,
            width: 3,
            indent: 10,
            endIndent: 10,
            thickness: 3,
          ),
          Container(
            margin: EdgeInsets.all(widget.blockVertical * 1.2),
            width: widget.blockHorizontal * 36.7,
            height: widget.size.height / 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Pilih Pembayaran',
                      style: TextStyle(fontSize: widget.blockHorizontal * 3.7),
                    ),
                    Text(
                      (orderModel[0].payment == null)
                          ? 'Pilih Metode'
                          : orderModel[0].payment,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: widget.blockHorizontal * 3.7),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethod()));
                    },
                    child: Icon(LineIcons.angleRight))
              ],
            ),
          )
        ],
      ),
    );
  }
}
