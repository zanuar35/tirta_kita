import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/login_screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.rubikTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}
