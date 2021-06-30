import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CardCart extends StatefulWidget {
  const CardCart({
    Key key,
    @required this.size,
    @required this.blockVertical,
    @required this.blockHorizontal,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  @override
  Widget build(BuildContext context) {
    int jml_brg = 1;

    return Container(
      width: widget.size.width / 1,
      height: widget.blockVertical * 15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          width: 3,
          color: Color(0xffE6E6E6),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(widget.blockHorizontal * 2),
        width: widget.size.width / 1,
        height: widget.size.height / 1,
        // color: Colors.amber,
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              // color: Colors.blue,
              child: Image(
                image: NetworkImage(
                    'https://i.ibb.co/vdDtdJv/Rectangle-88-removebg-preview.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              height: widget.size.height / 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Air Mineral Aqua 19L',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rp 18.000',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: widget.blockVertical * 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    LineIcons.minus,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: Center(
                      child: Text(
                        '$jml_brg',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(width: 2, color: Colors.grey)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        jml_brg += 1;
                      });
                    },
                    child: Icon(
                      LineIcons.plus,
                      size: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
