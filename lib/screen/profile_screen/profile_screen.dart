import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/daftar_pesanan/daftar_pesanan.dart';
import 'package:tirta_kita/screen/edit_profile/edit_profile.dart';
import 'package:tirta_kita/screen/help_screen/help_screen.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      backgroundColor: Color(0xffE7E7E7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: size.width / 1,
                        height: size.height / 4.6,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 20, 24, 35),
                          child: Container(
                            // color: Colors.green[50],
                            height: size.height / 5,
                            width: size.width / 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Profile',
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.2),
                                  ),
                                ),
                                SizedBox(height: blockVertical * 1.1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Text(
                                        "P",
                                        style: GoogleFonts.rubik(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 14)),
                                      ),
                                      maxRadius: blockVertical * 3.2,
                                      backgroundColor: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: blockHorizontal * 3,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Wahyudi Isman",
                                            style: TextStyle(
                                                fontSize: blockHorizontal * 4.1,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: blockVertical * 0.5,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                LineIcons.certificate,
                                                size: 30,
                                              ),
                                              SizedBox(
                                                width: blockHorizontal * 1.8,
                                              ),
                                              Text('Silver Member')
                                            ],
                                          ),
                                          SizedBox(
                                            height: blockHorizontal * 0.5,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfile(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Edit Profile',
                                              style: GoogleFonts.rubik(
                                                textStyle: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff265FAA),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: size.width / 1,
                        height: size.height / 4.6,
                        color: Colors.white,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Daftar Pesanan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: blockHorizontal * 4,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2)),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DaftarPesanan()));
                                    },
                                    child: Text(
                                      'Lihat Semua',
                                      style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: blockHorizontal * 3.8,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.2),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: (blockVertical) * 1.4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DaftarPesanan(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            LineIcons.shoppingBag,
                                            size: blockHorizontal * 8.8,
                                          ),
                                          SizedBox(
                                            height: (blockVertical) * 0.8,
                                          ),
                                          Text(
                                            "Belum Bayar",
                                            style: GoogleFonts.rubik(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      blockHorizontal * 3.7,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DaftarPesanan(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            LineIcons.shoppingBag,
                                            size: blockHorizontal * 8.8,
                                          ),
                                          SizedBox(
                                            height: (blockVertical) * 0.8,
                                          ),
                                          Text(
                                            "Sedang Dikirim",
                                            style: GoogleFonts.rubik(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      blockHorizontal * 3.7,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DaftarPesanan(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            LineIcons.shoppingBag,
                                            size: blockHorizontal * 8.8,
                                          ),
                                          SizedBox(
                                            height: (blockVertical) * 0.8,
                                          ),
                                          Text(
                                            "Selesai",
                                            style: GoogleFonts.rubik(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      blockHorizontal * 3.7,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.2),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(
                            top: (blockVertical) * 7,
                            left: size.width - (size.width - 24),
                            right: size.width - (size.width - 24),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: size.height / 5.55,
                    left: blockHorizontal * 5.5,
                    right: blockHorizontal * 5.5,
                    bottom: size.height / 5.55,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff0193DB),
                            Color(0xff2A9CD9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //margin: EdgeInsets.symmetric(vertical: 24),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: blockHorizontal * 8,
                            top: blockVertical * 1.7,
                            bottom: blockVertical * 1.7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              child: Text(
                                "P",
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                              ),
                              maxRadius: (blockVertical) * 2.8,
                              backgroundColor: Colors.amber,
                            ),
                            SizedBox(
                              width: blockHorizontal * 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Poin Kamu',
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: blockVertical * 0.65,
                                ),
                                Text(
                                  '1000 pts',
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: size.height / 6.2,
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
                        style: TextStyle(
                            fontSize: blockHorizontal * 4.5,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      LineIcons.questionCircle,
                                      size: 32,
                                      color: Color(0xff2A9CD4),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Bantuan',
                                      style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: blockHorizontal * 3.7,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height / 85,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    LineIcons.whatSApp,
                                    color: Color(0xff2A9CD4),
                                    size: 32,
                                  ),
                                  SizedBox(width: 12),
                                  Text('Hubungi Kontak Whatsapp',
                                      style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontSize: blockHorizontal * 3.7,
                                              fontWeight: FontWeight.w400)))
                                ],
                              )
                            ],
                          ),
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
                      Text("Logout Akun",
                          style: TextStyle(
                              fontSize: blockHorizontal * 4.5,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2)),
                      SizedBox(height: blockVertical * 2),
                      CustomButton(
                        height: (blockVertical) * 6.7,
                        fontWeight: FontWeight.w400,
                        text: 'Keluar Akun',
                        color: Color(0xff2BBAEC),
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
