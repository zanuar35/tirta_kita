import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:line_icons/line_icons.dart';


class PaymentPanel extends StatelessWidget {
  const PaymentPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.grey)),
      child: GFAccordion(
        title: 'Bantuan',
        contentChild: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: NetworkImage(
                          'https://i.ibb.co/sjfYwWx/image-15.png')),
                  Radio(value: 1, groupValue: 1, onChanged: (value) {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('No Rekening'),
                      Text('000028201122')
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
