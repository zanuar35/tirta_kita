import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';
import 'package:tirta_kita/screen/home_screen/widgets/card_product.dart';
import 'package:tirta_kita/screen/home_screen/widgets/category_widget.dart';

class ProductScreen extends StatefulWidget {
  //const ProductScreen({ Key? key }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String valueChoose;

  List<String> listItem = [
    "Outlet - Ciputra 1(2km)",
    "Outlet - Ciputra 2(3km)",
    "Outlet - Ciputra 3(4km)",
    "Outlet - Ciputra 4(5km)",
  ];

  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(2)),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff2661AB),
                          Color(0xff2BB8EB),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Container(
                  margin:
                      EdgeInsets.only(left: 24, right: 24, bottom: 15, top: 24),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  LineIcons.shippingFast,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: blockVertical * 2,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Toko Cabang",
                                        style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        height: blockVertical * 4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButton(
                                            icon: Icon(
                                              LineIcons.angleDown,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                            hint: Text(
                                              listItem[0],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            onChanged: (value) {
                                              print(value);
                                            },
                                            items: listItem
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    child: Text(
                                                      e,
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: blockVertical * 0.2,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Cari Produk...',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CategoryWidget(
                url: 'https://i.ibb.co/bHrLDGc/image-2-removebg-preview.png',
              ),
              Container(
                height: blockVertical * 60,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Color(0xff2A9FD8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png'),
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png')
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png'),
                          CardProductHome(
                              url: 'https://i.ibb.co/7jWgk8y/image-1.png')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0.89, 0.89),
          child: FloatingActionButton(
              child: Icon(
                LineIcons.shoppingCart,
                size: 32,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
