import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:line_icons/line_icons.dart';

class PaymentPanelImage extends StatefulWidget {
  final String url;
  final int radioValue;

  const PaymentPanelImage({Key key, this.url, this.radioValue})
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
        titleChild: Container(
            width: 200,
            height: 30,
            child: Image(
              image: NetworkImage(widget.url),
              alignment: Alignment.centerLeft,
            )),
        contentChild: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: NetworkImage(widget.url)),
                  Radio(
                      value: 0,
                      groupValue: widget.radioValue,
                      onChanged: (value) {
                        setState(() {
                          value = value;
                        });
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
                      Text(
                        'No Rekening',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '000028201122',
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