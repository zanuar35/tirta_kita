import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/login_screen/login_screen.dart';
import 'package:tirta_kita/screen/login_screen/widget/button_widget.dart';
import 'package:tirta_kita/screen/login_screen/widget/email_field_widget.dart';
import 'package:tirta_kita/screen/sign_up/widgets/name_fieldText.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPassController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void dispose() {
    _passwordController.dispose();
    _verifyPassController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _noTelpController.dispose();
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
                flex: 10,
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
                        NameTextField(controller: _nameController),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 85,
                        ),
                        LabelText(text: 'Phone Number'),
                        InputNo(
                          controller: _noTelpController,
                          hintText: 'type your phone number',
                          prefixText: '+62',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 85,
                        ),
                        LabelText(text: 'Email'),
                        EmailFieldWidget(controller: _emailController),
                        LabelText(text: 'Password'),
                        InputPassword(
                          hintText: 'type your password',
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 85,
                        ),
                        LabelText(text: 'Confirm Password'),
                        InputPassword(
                          controller: _verifyPassController,
                          hintText: 'type your password once again',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildButton()
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

  Widget buildButton() => ButtonWidget(
        text: 'Daftar',
        onClicked: () {
          regist();
        },
      );

  Future<void> regist() async {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    if (_passwordController.text != _verifyPassController.text) {
      EasyLoading.showError('Password tidak sesuai');
    } else if (_passwordController.text.isNotEmpty &&
        _verifyPassController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        (_passwordController.text == _verifyPassController.text) &&
        _noTelpController.text.isNotEmpty) {
      EasyLoading.showSuccess('Registrasi success');
    } else {
      EasyLoading.showError('Tidak boleh kosong');
    }
  }
  //   var response = await http.post(
  //       Uri.parse("https://api.tirtakitaindonesia.com/auth/register"),
  //       body: ({
  //         'nama': _nameController.text,
  //         'telepon': _noTelpController.text,
  //         'email': _emailController.text,
  //         'password': _passwordController.text
  //       }));
  //   if (response.statusCode == 201) {
  //     print(response.body);
  //     final data = jsonDecode(response.body);
  //     print(data["message"]);
  //     EasyLoading.showSuccess(data["message"]);
  //     Timer(Duration(seconds: 2), () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LoginScreen(),
  //         ),
  //       );
  //     });
  //   } else if (response.statusCode == 400) {
  //     Map<String, dynamic> map =
  //         new Map<String, dynamic>.from(json.decode(response.body));
  //     print(response.body);
  //     final data = jsonDecode(response.body);
  //     print(data["message"]["email"][0]);
  //     print(map["message"]);

  //     EasyLoading.showError((data["message"]["email"][0]).toString());
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Invalid Credentials"),
  //       ),
  //     );
  //   }
  // } else {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text("Black field not allowed"),
  //     ),
  //   );
}
