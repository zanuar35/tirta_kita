import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/login_screen/widget/loginBtn.dart';

class ProfileScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffB3B3B3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: size.height / 4,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 4,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 6,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: size.height / 6,
                width: size.width / 1,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.red[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Logout Akun",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(height: 8),
                      CustomButton(text: 'Keluar Akun')
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
