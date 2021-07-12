import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const InputPassword({
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_showPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(_showPassword ? LineIcons.eye : LineIcons.eyeSlash),
              ),
        fillColor: Color(0xfff8f8f8),
        hintText: widget.hintText,
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
