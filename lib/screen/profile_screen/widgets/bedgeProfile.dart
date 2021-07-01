import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgeProfile extends StatelessWidget {
  const BadgeProfile({
    Key key,
    @required this.size,
    @required this.blockHorizontal,
    @required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                        fontSize: blockHorizontal * 3.75),
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
                          fontSize: blockHorizontal * 4),
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
                          fontSize: blockHorizontal * 5.3),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
