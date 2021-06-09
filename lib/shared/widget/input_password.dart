import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants.dart';

class InputPassword extends StatelessWidget {
  final String hintText;
  const InputPassword({
    this.hintText,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(LineIcons.eyeSlash),
        fillColor: Color(0xfff8f8f8),
        hintText: hintText,
        hintStyle: GoogleFonts.rubik(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff2A2A2A).withOpacity(0.40),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:
              BorderSide(color: kBorderColor.withOpacity(0.3), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.blue, width: 2.4),
        ),
      ),
    );
  }
}
