import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirta_kita/screen/home_page/home.dart';
import 'package:tirta_kita/screen/home_screen/home_screen.dart';
import 'package:tirta_kita/screen/login_screen/widget/button_widget.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';
import 'package:tirta_kita/screen/login_screen/widget/email_field_widget.dart';
import 'package:tirta_kita/screen/sign_up/widgets/name_fieldText.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                          hintText: 'type your phone number',
                          prefixText: '+62',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 85,
                        ),
                        LabelText(text: 'Email'),
                        EmailFieldWidget(controller: emailController),
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
                          controller: _passwordController1,
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
          final form = formKey.currentState!;

          if (form.validate()) {
            final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          }
        },
      );
}
