import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    this.url,
    Key key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            "Daftar Promo",
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 110,
          child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.only(right: 15),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          child:
                              Image(image: NetworkImage(url), fit: BoxFit.fill),
                          height: 85,
                          width: 180,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 10),
                                blurRadius: 20,
                                color: kPrimaryColor.withOpacity(0.15))
                          ]),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
