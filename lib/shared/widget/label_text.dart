import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: AutoSizeText(
        text,
        minFontSize: 10,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
