import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/orderModel.dart';
import 'package:tirta_kita/screen/payment_method/widget/payment_panel.dart';
import 'package:tirta_kita/screen/payment_method/widget/pymt_pnl_png.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:tirta_kita/blocs/paymentMethod.dart';

class PaymentMethod extends StatefulWidget {
  //const PaymentMethod({ Key? key }) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

final prefs = SharedPreferences.getInstance();

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  void initState() {
    super.initState();
  }

  int index;
  int _value = 1;

  PaymentBloc blocs = PaymentBloc();
  String pay;

  @override
  Widget build(BuildContext context) {
    double blockVertical = (MediaQuery.of(context).size.height) / 100;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(LineIcons.angleLeft)),
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
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: [
                    PaymentPanel(
                      nilai: 2,
                      valueGroup: _value,
                      onTap: () {
                        blocs.inputan.add('transfer bank');
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
                        blocs.inputan.add('ovo');
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
                        blocs.inputan.add('dana');
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
                      padding: EdgeInsets.all(blockVertical * 2.9),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AutoSizeText(
                            'Cash On Delivery',
                            minFontSize: 8,
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
                                  offset: Offset(
                                      0, 8), // changes position of shadow
                                )
                              ],
                            ),
                            child: Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  blocs.inputan.add('cod');
                                  setState(() {
                                    _value = 1;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                    StreamBuilder(
                        stream: blocs.output,
                        builder: (context, snapshot) {
                          orderModel[0].payment = snapshot.data;
                          return Text('');
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Button(
                onPress: () async {
                  _sendDataBack(context);
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setInt('index', _value);
                  setState(() {
                    _value = prefs.getInt('index');
                  });
                  // prefs.setString('payment', orderModel[0].payment);
                },
                text: 'Pilih method',
                color: Color(0xff2BBAEC),
              )),
        )
      ]),
    );
  }

  void _sendDataBack(BuildContext context) {
    String textToSendBack = orderModel[0].payment;
    Navigator.pop(context, textToSendBack);
  }
}
