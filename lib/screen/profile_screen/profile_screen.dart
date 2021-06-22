import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffB3B3B3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height / 4,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.red[100],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 4,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(24, 50, 24, 10),
                  color: Colors.red[100],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 7,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Tentang",
                        style: GoogleFonts.rubik(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineIcons.questionCircle,
                                  size: 32,
                                ),
                                SizedBox(width: 12),
                                Text('Bantuan',
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)))
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  LineIcons.whatSApp,
                                  size: 32,
                                ),
                                SizedBox(width: 12),
                                Text('Hubungi Kontak Whatsapp',
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 6,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Logout Akun",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2),
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomButton(
                        height: 45,
                        fontWeight: FontWeight.w400,
                        text: 'Keluar Akun',
                        color: kBlueColor,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
