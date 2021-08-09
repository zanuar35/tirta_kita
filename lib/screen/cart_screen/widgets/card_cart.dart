import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/blocs/counter.dart';
import 'package:tirta_kita/model/orderModel.dart';

class CardCart extends StatefulWidget {
  const CardCart({
    this.urlFoto,
    this.productName,
    Key key,
    this.size,
    this.blockVertical,
    this.blockHorizontal,
    this.harga,
    this.id,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final double blockHorizontal;
  final String productName;
  final String harga;
  final String urlFoto;
  final int id;

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  CounterBloc blocs = CounterBloc();
  void initState() {
    super.initState();
  }

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
          color: Color(0xffA7BBC7),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(widget.blockHorizontal * 2),
        width: widget.size.width / 1,
        height: widget.size.height / 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
              width: 80,
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image(
                image: NetworkImage('${widget.urlFoto}'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: widget.blockHorizontal * 1,
                  bottom: widget.blockHorizontal * 1),
              height: widget.size.height / 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    widget.productName,
                    style: TextStyle(
                        fontSize: widget.blockVertical * 2.5,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Rp.  ${widget.harga}',
                    style: TextStyle(
                        fontSize: widget.blockVertical * 2.4,
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
                    width: widget.blockHorizontal * 9,
                    height: widget.blockHorizontal * 9,
                    child: Center(
                      child: StreamBuilder(
                        initialData: orderModel[0].jumlah,
                        stream: blocs.output,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
