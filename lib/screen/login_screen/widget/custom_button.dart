import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClicked;
  final double height;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const CustomButton({
     this.fontWeight,
     this.color,
     this.text,
     this.height,
     this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 5))
      ]),
      child: ElevatedButton(
        onPressed: onClicked,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
        ),
        child: AutoSizeText(
          text,
          minFontSize: 12,
          style: TextStyle(
              fontSize: 18, fontWeight: fontWeight, color: Colors.white),
        ),
      ),
    );
  }
}
