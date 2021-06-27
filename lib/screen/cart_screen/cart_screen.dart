import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  //const CartScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: <Widget>[
            Container(
              width: blockVertical * 100,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: size.width,
                    height: blockVertical * 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff2879BD), Color(0xff298DCC)],
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight),
                    ),
                  ),
                  Positioned(
                    top: blockVertical * 15,
                    child: Container(
                      width: size.width,
                      height: blockVertical * 85,
                      decoration: BoxDecoration(
                        color: Color(0xfffffffd),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(24, 50, 24, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Pesanan',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "+ Tambah Pesanan",
                                  style: TextStyle(
                                      color: Color(0xff276FB6),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: blockVertical * 3,
                            ),
                            Container(
                                width: size.width / 1,
                                height: blockVertical * 15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                    width: 3,
                                    color: Color(0xffE6E6E6),
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(blockHorizontal * 2),
                                  width: size.width / 1,
                                  height: size.height / 1,
                                  color: Colors.amber,
                                  child: Row(
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
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Air Mineral Aqua 19L',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Rp 18.000',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

/*

Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: blockVertical * 20,
            color: Colors.blue,
          ),
          Container(
            width: size.width,
            height: blockVertical * 80,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
        ],
      ),
*/