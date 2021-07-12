import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/shared/widget/button.dart';

class KonfirmasiPembayaran extends StatelessWidget {
  // const KonfirmasiPembayaran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Konfirmasi \nPembayaran',
                  style: TextStyle(
                      fontSize: blockHorizontal * 7,
                      height: blockHorizontal * 0.37,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: blockVertical * 10,
                ),
                Center(
                  child: Container(
                    height: blockVertical * 40,
                    width: blockVertical * 40,
                    child: Center(
                      child: Icon(
                        LineIcons.alternateCloudUpload,
                        size: blockHorizontal * 26,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Color(0xffCCCCCC)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(0, 8), // changes position of shadow
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: blockVertical * 3),
                Text(
                  'Harap konfirmasi jika sudah melakukan pembayaran',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: blockHorizontal * 4,
                      height: blockHorizontal * 0.4,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: blockVertical * 5,
                ),
                Button(
                  text: 'Konfirmasi',
                  color: Color(0xff2BBAEC),
                )
              ],
            ),
          )),
    );
  }
}
