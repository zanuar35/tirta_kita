import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SedangKirim extends StatelessWidget {
  //const SedangKirim({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            width: size.width / 1,
            height: blockVertical * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width / 1,
                  height: blockVertical * 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xfffdfdfd),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 8), // changes position of shadow
                      )
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: blockHorizontal * 5,
                        vertical: blockVertical * 2),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: blockHorizontal * 15,
                              width: blockHorizontal * 15,
                              child: Image(
                                image: NetworkImage(
                                  'https://i.ibb.co/NsYWbNM/Rectangle-117.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Beras Rojo Lele 5 kg",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: blockVertical * 1),
                                Text(
                                  "Jumlah : 2 Pcs",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Text(
                              "Rp 50.000",
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: blockVertical * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total Bayar :",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Rp. 100.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: blockVertical * 1.2,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Lacak Pesanan',
                                style: TextStyle(
                                    fontSize: 13,
                                    letterSpacing: 0.7,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff265FAA)),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: blockVertical * 2,
                ),
              ],
            ),
          ),
        ));
  }
}
