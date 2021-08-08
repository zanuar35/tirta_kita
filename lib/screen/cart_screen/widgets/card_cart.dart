import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/blocs/counter.dart';

class CardCart extends StatefulWidget {
  const CardCart({
    this.productName,
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
    this.harga,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final String productName;
  final String harga;

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  CounterBloc blocs = CounterBloc();

  get blockHorizontal => null;
  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            Container(
              margin: EdgeInsets.only(
                  top: widget.blockHorizontal * 5.3,
                  bottom: widget.blockHorizontal * 5.3),
              height: widget.size.height / 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style: TextStyle(
                        fontSize: widget.blockVertical * 2.2,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.harga,
                    style: TextStyle(
                        fontSize: widget.blockVertical * 2,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: widget.blockVertical * 4),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Icon(
                      LineIcons.minus,
                      size: widget.blockHorizontal * 5,
                    ),
                    onTap: () {
                      blocs.inputan.add('minus');
                    },
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    width: widget.blockHorizontal * 5.8,
                    height: widget.blockHorizontal * 5.8,
                    child: Center(
                      child: StreamBuilder(
                        initialData: 1,
                        stream: blocs.output,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(width: 2, color: Colors.grey)),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    child: Icon(
                      LineIcons.plus,
                      size: widget.blockHorizontal * 5,
                    ),
                    onTap: () {
                      blocs.inputan.add('add');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
