import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/screen/profile_screen/widgets/ContainerCart.dart';
import 'package:tirta_kita/screen/profile_screen/widgets/ContainerProfile.dart';
import 'package:tirta_kita/screen/profile_screen/widgets/ContainerTentang.dart';
import 'package:tirta_kita/screen/profile_screen/widgets/bedgeProfile.dart';
import 'package:tirta_kita/screen/splash_screen/splash_screen.dart';

import 'widgets/ContainerLogoutBtn.dart';

class ProfileScreen extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    logOut() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('slogin', false);

      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LauncherPage(),
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffE7E7E7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: [
                      ContainerProfile(
                          size: size,
                          blockVertical: blockVertical,
                          blockHorizontal: blockHorizontal),
                      SizedBox(height: 15),
                      ContainerCart(
                          size: size,
                          blockHorizontal: blockHorizontal,
                          blockVertical: blockVertical)
                    ],
                  ),
                  BadgeProfile(
                      size: size,
                      blockHorizontal: blockHorizontal,
                      blockVertical: blockVertical)
                ],
              ),
              SizedBox(
                height: blockVertical * 4,
              ),
              ContainerTentang(
                size: size,
                blockHorizontal: blockHorizontal,
                blockVertical: blockVertical,
              ),
              SizedBox(height: blockVertical * 4),
              ContainerLogoutBtn(
                  onPressed: logOut,
                  size: size,
                  blockHorizontal: blockHorizontal,
                  blockVertical: blockVertical),
            ],
          ),
        ),
      ),
    );
  }
}
