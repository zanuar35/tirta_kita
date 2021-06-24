import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/profile_screen/profile_screen.dart';

class HelpScreen extends StatefulWidget {
  //const HelpScreen({ Key? key }) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.angleLeft),
        ),
        title: Text(
          'Bantuan',
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400)),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff2662AC), Color(0xff2BB8EA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: screenWidth - (screenWidth - 24),
              vertical: screenHeight - (screenHeight - 12)),
          color: Colors.amber,
          child: ListView(
            children: <Widget>[],
          )),
    );
  }
}
