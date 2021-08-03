import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardProductHome extends StatelessWidget {
  final String url;
  final String namaProduk;

  CardProductHome({
    this.namaProduk,
    this.url,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: blockVertical * 30,
            width: blockHorizontal * 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 16,
                    color: Color(0xff000000).withOpacity(0.2),
                  )
                ]),
            child: Column(
              children: [
                Container(
                  height: blockVertical * 25,
                  width: blockHorizontal * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: blockVertical * 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: blockHorizontal * 16.2,
                          height: blockVertical * 18,
                          child: Image(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AutoSizeText(
                  namaProduk,
                  minFontSize: 11,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
