import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class KonfirmasiPembayaran extends StatelessWidget {
  // const KonfirmasiPembayaran({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Container(
            color: Colors.green[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Konfirmasi \nPembayaran',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: blockVertical * 10,
                ),
                Container(
                  height: blockVertical * 40,
                  width: blockVertical * 40,
                  child: Center(
                    child: Icon(
                      LineIcons.alternateCloudUpload,
                      size: 32,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 3, color: Color(0xffCCCCCC)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 8), // changes position of shadow
                      )
                    ],
                  ),
                ),
                SizedBox(height: blockVertical * 3),
                Text(
                  'Harap konfirmasi jika sudah melakukan pembayaran',
                  maxLines: 2,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )),
    );
  }
}
