import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/payment_method/widget/payment_panel.dart';

class PaymentMethod extends StatelessWidget {
  //const PaymentMethod({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakai Promo'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff2661AB), Color(0xff2AA5DD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            PaymentPanel(),
            SizedBox(
              height: 20,
            ),
            PaymentPanel(),
            SizedBox(
              height: 20,
            ),
            PaymentPanel(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
