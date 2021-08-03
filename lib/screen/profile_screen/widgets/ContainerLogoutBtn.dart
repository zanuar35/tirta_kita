import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:tirta_kita/screen/splash_screen/splash_screen.dart';

class ContainerLogoutBtn extends StatefulWidget {
  const ContainerLogoutBtn({
    Key key,
    this.size,
    this.blockHorizontal,
    this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;

  @override
  _ContainerLogoutBtnState createState() => _ContainerLogoutBtnState();
}

class _ContainerLogoutBtnState extends State<ContainerLogoutBtn> {
  String token = '';

  Object get body => null;

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 6,
      width: widget.size.width / 1,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: widget.blockHorizontal * 6.4,
            vertical: widget.blockVertical * 1.84),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Logout Akun",
                style: TextStyle(
                    fontSize: widget.blockHorizontal * 4.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2)),
            SizedBox(height: widget.blockVertical * 2),
            CustomButton(
              onClicked: logOut,
              height: (widget.blockVertical) * 7, //6,7,
              fontWeight: FontWeight.w400,
              text: 'Keluar Akun',
              color: Color(0xff2BBAEC),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    print(token);
    var response = await http.post(
      Uri.parse("https://api.tirtakitaindonesia.com/auth/logout"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Logout sukses');
      prefs.setBool('slogin', false);
      prefs.clear();
      print(prefs.getString('userName'));
      print(prefs.getString('userEmail'));
      print(prefs.getString('userUrlPhoto'));
      print(prefs.getString('token'));
      Timer(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LauncherPage(),
          ),
        );
      });
    } else {
      EasyLoading.showError('Logout Error');
    }
  }
}
