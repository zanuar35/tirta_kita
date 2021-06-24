import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/home_screen/widgets/category_widget.dart';


class ProductScreen extends StatelessWidget {
  //const ProductScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2)),
                  gradient: LinearGradient(colors: [
                    Color(0xff2661AB),
                    Color(0xff2BB8EB),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Container(
                margin:
                    EdgeInsets.only(left: 24, right: 24, bottom: 15, top: 24),
                child: Container(
                  height: 70,
                  width: 200,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                LineIcons.shippingFast,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.height / 30,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Toko cabang",
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 85,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          // height: MediaQuery.of(context).size.height / 17,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CategoryWidget(
              url: 'https://i.ibb.co/bHrLDGc/image-2-removebg-preview.png',
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              color: Colors.red[100],
            ),
          ],
        ),
      ),
    );
  }
}
