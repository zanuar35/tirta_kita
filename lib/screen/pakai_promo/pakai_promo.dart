import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/pakai_promo/widget/promo_card.dart';
import 'package:tirta_kita/screen/pakai_promo/widget/search_box.dart';
import 'package:tirta_kita/shared/widget/button.dart';

class PakaiPromo extends StatelessWidget {
  //const PakaiPromo({ Key? key }) : super(key: key);

  int _value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: blockVertical * 9,
        centerTitle: true,
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
      body: Stack(children: <Widget>[
        Container(
          height: blockVertical * 100,
          margin: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              SearchBox(size: size, blockVertical: blockVertical),
              SizedBox(
                height: blockVertical * 5,
              ),
              PromoCard(
                size: size,
                blockVertical: blockVertical,
              ),
              SizedBox(
                height: blockVertical * 3,
              ),
              PromoCard(
                size: size,
                blockVertical: blockVertical,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button(text: 'Pilih Promo'),
          ),
        )
      ]),
    );
  }
}
