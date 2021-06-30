import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';
import 'package:tirta_kita/screen/daftar_pesanan/sedang_kirim/widget/card_product.dart';
import 'package:tirta_kita/screen/daftar_pesanan/selesai/widget/card_product.dart';
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
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.25,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: NetworkImage(
                            'https://i.ibb.co/WPpq4mk/image-4.png'),
                        fit: BoxFit.fill,
                      ),
                      height: size.height * 0.25 - 27,
                      width: size.width / 1,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        child: Image(image: NetworkImage('https://i.ibb.co/z4zCXW6/Rectangle-116.png')),
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
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Paling Laris",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 13)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png'),
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png'),
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png')
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0.89, 0.89),
          child: FloatingActionButton(
            onPressed: () {},
            child: InkWell(
                child: Icon(
                  LineIcons.shoppingCart,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                }),
          ),
        )
      ]),
    );
  }
}
