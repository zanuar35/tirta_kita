import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/help_screen/help_screen.dart';

class ContainerTentang extends StatelessWidget {
  const ContainerTentang({
    required this.blockVertical,
    Key? key,
    required this.size,
    required this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 6.2,
      width: size.width / 1,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: blockHorizontal * 6.4, vertical: blockVertical * 1.39),
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
              height: blockVertical * 0.98,
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
                margin: EdgeInsets.only(left: blockHorizontal * 3.2),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            LineIcons.questionCircle,
                            size: blockVertical * 3.9,
                            color: Color(0xff2A9CD4),
                          ),
                          SizedBox(width: blockHorizontal * 1.4),
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
                          size: blockVertical * 3.9,
                        ),
                        SizedBox(width: blockHorizontal * 1.4),
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
    );
  }
}
