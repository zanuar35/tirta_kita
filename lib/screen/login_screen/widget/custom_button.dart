import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClicked;
  final double height;
  final String text;
  final FontWeight fontWeight;
  final Color color;

  const CustomButton({
    required this.fontWeight,
    required this.color,
    required this.text,
    required this.height,
    required this.onClicked,
    Key? key,
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
