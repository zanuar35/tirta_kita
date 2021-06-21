import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 15, 0, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3))
                ]),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            width: 61,
                            height: 99,
                            child: Image(
                                image: NetworkImage(
                                    'https://i.ibb.co/7jWgk8y/image-1.png'))),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Product 1',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Harga',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF2BBAEC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        LineIcons.shoppingCart,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: size.width / 40),
                      Text(
                        'Add to cart',
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
