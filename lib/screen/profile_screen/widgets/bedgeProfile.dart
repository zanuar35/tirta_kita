import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BadgeProfile extends StatefulWidget {
  const BadgeProfile({
    Key? key,
    required this.size,
    required this.blockHorizontal,
    required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;

  @override
  _BadgeProfileState createState() => _BadgeProfileState();
}



class _BadgeProfileState extends State<BadgeProfile> {
  


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.size.height / 5.4,
      left: widget.blockHorizontal * 5.5,
      right: widget.blockHorizontal * 5.5,
      bottom: widget.size.height / 6,
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
              left: widget.blockHorizontal * 8,
              top: widget.blockVertical * 1.5,
              bottom: widget.blockVertical * 1.5),
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
                        fontSize: widget.blockHorizontal * 3.75),
                  ),
                ),
                maxRadius: (widget.blockVertical) * 2.8,
                backgroundColor: Colors.amber,
              ),
              SizedBox(
                width: widget.blockHorizontal * 5,
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
                          fontSize: widget.blockHorizontal * 4),
                    ),
                  ),
                  SizedBox(
                    height: widget.blockVertical * 0.50,
                  ),
                  Text(
                    '1000 pts',
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: widget.blockHorizontal * 5),
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
