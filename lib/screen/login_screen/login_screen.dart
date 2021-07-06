import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/screen/sign_up/sign_up_screen.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';

import 'widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

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
      body: SingleChildScrollView(
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
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        LabelText(
                          text: "Email",
                        ),
                        InputText(
                          controller: emailController,
                          hintText: 'type tour email',
                        ),
                        SizedBox(
                          height: blockVertical * 2.4,
                        ),
                        LabelText(
                          text: 'Password',
                        ),
                        InputPassword(
                          controller: _passwordController,
                          hintText: 'type your password',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Lupa Password",
                              style: TextStyle(
                                  color: Color(0xFF2BBAEC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 20),
                        CustomButton(
                          fontWeight: FontWeight.w500,
                          height: MediaQuery.of(context).size.height / 16,
                          text: 'Login',
                          onClicked: () {
                            final form = formKey.currentState!;
                            if (form.validate()) {
                              final email = emailController.text;

                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text('Your Email is $email')));
                            }
                          },
                          color: kBlueColor,
                        ),
                        SizedBox(
                          height: blockVertical * 0.61,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Belum punya akun ?",
                              minFontSize: 7,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13),
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
    );
  }
}
