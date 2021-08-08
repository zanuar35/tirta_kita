import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class CardProductHome extends StatelessWidget {
  final String url;
  final String namaProduk;
  final String harga;
  final VoidCallback onPressed;

  CardProductHome({
    this.harga,
    this.namaProduk,
    this.url,
    this.onPressed,
    Key key,
    //@required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 16,
                    color: Color(0xff000000).withOpacity(0.15),
                  )
                ]),
            child: Column(
              children: [
                Container(
                  height: blockHorizontal * 37,
                  width: blockHorizontal * 40,
                  decoration: BoxDecoration(
                    //color: Colors.green[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: blockVertical * 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: blockHorizontal * 16.5,
                          height: blockVertical * 12.1,
                          child: Image(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                        AutoSizeText(
                          namaProduk,
                          minFontSize: 11,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        AutoSizeText(
                          'Rp. $harga',
                          minFontSize: 12,
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onPressed,
                  child: Container(
                    height: blockVertical * 6, //4.3,
                    width: blockHorizontal * 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF2BBAEC),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          LineIcons.shoppingCart,
                          size: blockHorizontal * 8,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: blockHorizontal * 1,
                        ),
                        AutoSizeText(
                          'Add to cart',
                          minFontSize: 11,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
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
