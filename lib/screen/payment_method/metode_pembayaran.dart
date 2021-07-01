import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/payment_method/widget/payment_panel.dart';
import 'package:tirta_kita/screen/payment_method/widget/pymt_pnl_png.dart';
import 'package:tirta_kita/shared/widget/button.dart';

class PaymentMethod extends StatefulWidget {
  //const PaymentMethod({ Key? key }) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    double blockVertical = (MediaQuery.of(context).size.height) / 100;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: blockVertical * 9,
        title: Text('Metode Pembayaran'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff2661AB), Color(0xff2AA5DD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
      ),
      body: Stack(children: <Widget>[
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(24),
              child: Column(
                children: [
                  PaymentPanel(
                    nilai: 2,
                    valueGroup: _value,
                    onTap: () {
                      setState(() {
                        _value = 2;
                      });
                    },
                  ),
                  SizedBox(
                    height: blockVertical * 2.4,
                  ),
                  PaymentPanelImage(
                    nilai: 3,
                    valueGroup: _value,
                    onTap: () {
                      setState(() {
                        _value = 3;
                      });
                    },
                    url: 'https://i.ibb.co/FV2Q1bn/image-17.png',
                  ),
                  SizedBox(
                    height: blockVertical * 2.4,
                  ),
                  PaymentPanelImage(
                    nilai: 4,
                    valueGroup: _value,
                    onTap: () {
                      setState(() {
                        _value = 4;
                      });
                    },
                    url: 'https://i.ibb.co/bQJvRJG/image-16.png',
                  ),
                  SizedBox(
                    height: blockVertical * 2.4,
                  ),
                  Container(
                    width: blockHorizontal * 100,
                    height: blockVertical * 8.62,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Cash On Delivery',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 0,
                                blurRadius: 16,
                                offset:
                                    Offset(0, 8), // changes position of shadow
                              )
                            ],
                          ),
                          child: Radio(
                              value: 5,
                              groupValue: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Button(text: 'Pilih method')),
        )
      ]),
    );
  }
}
