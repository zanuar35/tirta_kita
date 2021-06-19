import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/screen/home_screen/widgets/card_product.dart';

import 'widgets/category_widget.dart';
import 'widgets/promo_widget.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.blue[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: size.height * 0.25,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.25 - 27,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: size.height - 5,
                          width: size.width - 5,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Wahyudi Isman",
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        LineIcons.certificate,
                                        size: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text('Silver Member')
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                height: size.height / 8,
                                width: size.width / 8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      height: 70,
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 25,
                                color: Colors.black.withOpacity(0.4))
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          
          CategoryWidget(
            url: 'https://i.ibb.co/bHrLDGc/image-2-removebg-preview.png',
          ),

          /*
            Promo banner
          */
          PromoWidget(
            url: 'https://i.ibb.co/kMJND02/image-3-1.png',
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              "Paling Laris",
              style: GoogleFonts.rubik(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            ),
          ),
          /*
            Card Produk
          */
          CardProduct(size: size)
        ],
      ),
    );
  }
}
