import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/daftar_pesanan/belum_bayar/belum_bayar.dart';
import 'package:tirta_kita/screen/daftar_pesanan/sedang_kirim/sedang_kirim.dart';
import 'package:tirta_kita/screen/daftar_pesanan/selesai/delivered.dart';

class DaftarPesanan extends StatelessWidget {
  //const DaftarPesanan({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 122,
          title: Text(
            'Daftar Pesanan',
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(LineIcons.angleLeft)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff2660AB), Color(0xff2BB5E8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xff6BCDF1),
            indicatorWeight: 5,
            tabs: [
              Tab(
                child: Text(
                  "Belum Bayar",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 0.6),
                ),
              ),
              Tab(
                child: Text(
                  "Sedang dikirim",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Selesai",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 0.6),
                ),
              )
            ],
          ),
          elevation: 12,
          titleSpacing: 12,
        ),
        body: TabBarView(children: <Widget>[
          BelumBayar(),
          SedangKirim(),
          SelesaiKirim(),
        ]),
      ),
    );
  }
}
