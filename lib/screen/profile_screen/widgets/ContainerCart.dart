import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/daftar_pesanan/daftar_pesanan.dart';

class ContainerCart extends StatelessWidget {
  const ContainerCart({
    Key? key,
    required this.size,
    required this.blockHorizontal,
    required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 1,
      height: size.height / 4.6,
      color: Colors.white,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            builder: (context) => DaftarPesanan()));
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
                left: blockHorizontal * 3.2,
                right: blockHorizontal * 3.2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DaftarPesanan(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          LineIcons.shoppingBag,
                          size: blockHorizontal * 8,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Belum Bayar",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: blockHorizontal * 3.7,
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
                          builder: (context) => DaftarPesanan(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          LineIcons.shoppingBag,
                          size: blockHorizontal * 8,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sedang Dikirim",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: blockHorizontal * 3.7,
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
                          builder: (context) => DaftarPesanan(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          LineIcons.shoppingBag,
                          size: blockHorizontal * 8,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Selesai",
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: blockHorizontal * 3.7,
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
          top: (blockVertical) * 6,
          left: size.width - (size.width - 24),
          right: size.width - (size.width - 24),
        ),
      ),
    );
  }
}
