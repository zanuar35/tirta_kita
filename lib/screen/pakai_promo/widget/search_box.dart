import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.size,
    required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: size.width / 1,
      height: blockVertical * 8,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Cari Promo...', border: InputBorder.none),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: (Colors.grey[300])!),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 16,
            offset: Offset(0, 8), // changes position of shadow
          )
        ],
      ),
    );
  }
}
