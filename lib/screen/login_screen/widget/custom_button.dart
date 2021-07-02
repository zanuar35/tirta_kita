import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback onpressed;
  final double height;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const CustomButton({
    this.fontWeight,
    this.color,
    @required this.text,
    this.height,
    this.onpressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 2,
            offset: Offset(2, 3))
      ]),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
                fontSize: 18, fontWeight: fontWeight, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
