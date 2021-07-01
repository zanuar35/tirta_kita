import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:line_icons/line_icons.dart';

class PaymentPanel extends StatefulWidget {
  PaymentPanel({this.nilai, this.onTap, this.valueGroup});

  final int nilai;
  int valueGroup;
  final GestureTapCallback onTap;

  @override
  _PaymentPanelState createState() => _PaymentPanelState();
}

class _PaymentPanelState extends State<PaymentPanel> {
  @override
  Widget build(BuildContext context) {
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: GFAccordion(
        title: 'Transfer Atm',
        contentChild: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: NetworkImage(
                          'https://i.ibb.co/sjfYwWx/image-15.png')),
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
