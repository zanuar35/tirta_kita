import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  PromoCard({
    this.onTap,
    this.nilai,
    this.valueGroup,
    this.widget,
    Key key,
    @required this.size,
    @required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockVertical;
  final Widget widget;

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
        margin: EdgeInsets.all(15),
        width: widget.size.width / 1,
        height: widget.size.height / 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Diskon 123',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3),
                ),
                Text(
                  'Potongan Total Transaksi Sebesar \n Rp 20.000',
                  style: TextStyle(
                      height: 1.5, fontSize: 13, fontWeight: FontWeight.w500),
                ),
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
