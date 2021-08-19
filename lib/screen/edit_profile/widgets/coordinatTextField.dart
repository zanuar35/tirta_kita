import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class CoordinatTextField extends StatefulWidget {
  CoordinatTextField({
    this.latitude,
    this.longitude,
    Key key,
  }) : super(key: key);

  final String latitude;
  final String longitude;

  @override
  State<CoordinatTextField> createState() => _CoordinatTextFieldState();
}

class _CoordinatTextFieldState extends State<CoordinatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: (widget.latitude == '' && widget.longitude == '')
              ? ''
              : widget.latitude.toString() +
                  ' , ' +
                  widget.longitude.toString(),
          hintStyle: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 12,
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
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
