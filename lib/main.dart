import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/edit_profile/edit_profile.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/home_screen/home_screen.dart';
import 'package:tirta_kita/screen/login_screen/login_screen.dart';
import 'package:tirta_kita/screen/product_screen/product_screen.dart';
import 'package:tirta_kita/screen/sign_up/sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
