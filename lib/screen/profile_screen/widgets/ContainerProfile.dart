import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/screen/edit_profile/edit_profile.dart';

class ContainerProfile extends StatefulWidget {
  const ContainerProfile({
    Key? key,
    required this.size,
    required this.blockVertical,
    required this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;

  @override
  _ContainerProfileState createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  String nama = '';
  String urlPhoto = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('userName').toString();
      urlPhoto = prefs.getString('userUrlPhoto').toString();
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: widget.size.width / 1,
      height: widget.size.height / 4.6,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            widget.blockHorizontal * 6.4,
            widget.blockVertical * 2.10,
            widget.blockHorizontal * 6.4,
            widget.blockVertical * 4),
        child: Container(
          color: Colors.white,
          height: widget.size.height / 5,
          width: widget.size.width / 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Profile',
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                      fontSize: widget.blockHorizontal * 6.4,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2),
                ),
              ),
              SizedBox(height: widget.blockVertical * 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: widget.blockVertical * 3.2,
                    backgroundImage: NetworkImage(urlPhoto),
                  ),
                  SizedBox(
                    width: widget.blockHorizontal * 3,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          nama,
                          style: TextStyle(
                              fontSize: widget.blockHorizontal * 3.7,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              LineIcons.certificate,
                              size: widget.blockHorizontal * 8,
                            ),
                            SizedBox(
                              width: widget.blockHorizontal * 1.5,
                            ),
                            Text('Silver Member')
                          ],
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
                                  fontSize: widget.blockHorizontal * 3.7,
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
