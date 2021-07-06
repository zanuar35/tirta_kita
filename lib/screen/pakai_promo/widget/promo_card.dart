import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  PromoCard({
    required this.onTap,
    required this.nilai,
    required this.valueGroup,
    Key? key,
    required this.size,
    required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockVertical;

  final int nilai;
  int valueGroup;
  final GestureTapCallback onTap;

  @override
  _PromoCardState createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width / 1,
      height: widget.blockVertical * 13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1.2,
          color: Color(0xff9A9090),
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(
            widget.blockVertical * 1.5,
            widget.blockVertical * 1,
            widget.blockVertical * 1.5,
            widget.blockVertical * 1),
        width: widget.size.width / 1,
        height: widget.size.height / 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  'Diskon 123',
                  minFontSize: 4,
                  style: TextStyle(
                      letterSpacing: 0.3,
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                AutoSizeText(
                  'Potongan Total Transaksi Sebesar \n Rp 20.000',
                  minFontSize: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.5, fontSize: 13, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Radio(
                value: widget.nilai,
                groupValue: widget.valueGroup,
                onChanged: (nilai) {
                  setState(() {
                    widget.valueGroup = widget.nilai;
                  });
                  widget.onTap();
                })
          ],
        ),
      ),
    );
  }
}
