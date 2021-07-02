import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();

  void dispose() {
    _passwordController.dispose();
    _passwordController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Register",
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 10),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LabelText(text: 'Name'),
                        InputText(hintText: 'type your email'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 62,
                        ),
                        LabelText(text: 'Phone Number'),
                        InputNo(
                          hintText: 'type your phone number',
                          prefixText: '+62',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 62,
                        ),
                        LabelText(text: 'Password'),
                        InputPassword(
                          hintText: 'type your password',
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 62,
                        ),
                        LabelText(text: 'Confirm Password'),
                        InputPassword(
                          controller: _passwordController1,
                          hintText: 'type your password once again',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          text: 'Daftar',
                          color: kBlueColor,
                          height: MediaQuery.of(context).size.height / 16,
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
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
