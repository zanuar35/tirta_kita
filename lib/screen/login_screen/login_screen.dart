import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/login_screen/widget/button_widget.dart';
import 'package:tirta_kita/screen/login_screen/widget/email_field_widget.dart';
import 'package:tirta_kita/screen/sign_up/sign_up_screen.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff254D9E), Color(0xff2BBAEC)],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: blockVertical * 4.4,
                          horizontal: blockHorizontal * 6.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: AutoSizeText(
                              "Tirta Kita",
                              minFontSize: 16,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(blockVertical * 2.955),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              'Login',
                              minFontSize: 8,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 17),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            LabelText(
                              text: "Email",
                            ),
                            EmailFieldWidget(controller: emailController),
                            SizedBox(
                              height: blockVertical * 2.4,
                            ),
                            LabelText(
                              text: 'Password',
                            ),
                            InputPassword(
                              controller: passController,
                              hintText: 'type your password',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 20),
                            buildButton(),
                            SizedBox(
                              height: blockVertical * 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Belum punya akun ?",
                                  minFontSize: 7,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen()),
                                    );
                                  },
                                  child: Text(
                                    "Daftar Akun",
                                    style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2BBAEC),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'LOGIN',
        onClicked: () {
          login();
        },
      );

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      var response = await http.post(
          Uri.parse("https://api.tirtakitaindonesia.com/auth/login"),
          body: ({
            'email': emailController.text,
            'password': passController.text
          }));

      if (response.statusCode == 200) {
        prefs.setBool('slogin', true);
        print(response.body);
        final data = jsonDecode(response.body);
        print(data["message"]);
        print(prefs.getBool('slogin'));
        EasyLoading.showSuccess(
            data["message"] + " | Hallo " + data["data"]["nama"]);

        prefs.setString('userName', data["data"]["nama"]);
        prefs.setString('userEmail', data["data"]["email"]);
        prefs.setString('userUrlPhoto', data["data"]["foto"]);
        prefs.setString('token', data["token"]);

        print(prefs.getString('userName'));
        print(prefs.getString('userEmail'));
        print(prefs.getString('userUrlPhoto'));
        print(prefs.getString('token'));

        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      } else if (response.statusCode == 401) {
        print(response.body);
        final data = jsonDecode(response.body);
        print(data["message"]);
        EasyLoading.showError(data["message"]);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid Credentials"),
          ),
        );
      }
    } else {
      EasyLoading.showError("Black field not allowed");
    }
  }
}
