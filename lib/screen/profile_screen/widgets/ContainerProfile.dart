import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/edit_profile/edit_profile.dart';

class ContainerProfile extends StatelessWidget {
  const ContainerProfile({
    Key key,
    @required this.size,
    @required this.blockVertical,
    @required this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size.width / 1,
      height: size.height / 4.6,
      child: Padding(
        padding: EdgeInsets.fromLTRB(blockHorizontal * 6.4,
            blockVertical * 2.40, blockHorizontal * 6.4, blockVertical * 4.31),
        child: Container(
          color: Colors.white,
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
                      fontSize: blockHorizontal * 6.4,
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
                              fontSize: blockHorizontal * 3.7)),
                    ),
                    maxRadius: blockVertical * 3.2,
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(
                    width: blockHorizontal * 3,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Wahyudi Isman",
                          style: TextStyle(
                              fontSize: blockHorizontal * 3.7,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: blockVertical * 0.8,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              LineIcons.certificate,
                              size: blockHorizontal * 8,
                            ),
                            SizedBox(
                              width: blockHorizontal * 1.5,
                            ),
                            Text('Silver Member')
                          ],
                        ),
                        SizedBox(
                          height: blockHorizontal * 0.5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            );
                          },
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: blockHorizontal * 3.7,
                                  color: Color(0xff265FAA),
                                  fontWeight: FontWeight.w700),
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
    );
  }
}
