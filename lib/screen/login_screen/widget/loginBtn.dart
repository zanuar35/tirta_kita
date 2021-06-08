import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 18,
      decoration: BoxDecoration(),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xFF2BBAEC),
          ),
        ),
        child: Text(
          "Login",
          style: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
