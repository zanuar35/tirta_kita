import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:line_icons/line_icons.dart';

class PaymentPanelImage extends StatefulWidget {
  final int nilai;
  int valueGroup;
  final GestureTapCallback onTap;

  final String url;

  PaymentPanelImage(
      {Key? key,
      required this.url,
      required this.nilai,
      required this.onTap,
      required this.valueGroup})
      : super(key: key);

  @override
  _PaymentPanelImageState createState() => _PaymentPanelImageState();
}

class _PaymentPanelImageState extends State<PaymentPanelImage> {
  @override
  Widget build(BuildContext context) {
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: GFAccordion(
        contentPadding: EdgeInsets.all(0),
        titleChild: Container(
          width: 200,
          height: 30,
          child: Image(
            image: NetworkImage(widget.url),
            alignment: Alignment.centerLeft,
          ),
        ),
        contentChild: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: NetworkImage(widget.url),
                  ),
                  Radio(
                      value: widget.nilai,
                      groupValue: widget.valueGroup,
                      onChanged: (value) {
                        setState(() {
                          widget.valueGroup = widget.nilai;
                        });
                        widget.onTap();
                      })
                ],
              ),
              SizedBox(
                height: blockVertical * 1.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        'No Rekening',
                        minFontSize: 6,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      AutoSizeText(
                        '000028201122',
                        minFontSize: 8,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Icon(LineIcons.copy)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
