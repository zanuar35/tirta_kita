import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/kategori_model.dart';
import 'package:tirta_kita/model/laris_model.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';
import 'package:http/http.dart' as http;
import 'package:tirta_kita/screen/product_screen/widget/productCard.dart';
import 'package:tirta_kita/screen/product_screen/widget/shimmerCategory.dart';

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

  String urlPhoto = '';
  String token = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
      urlPhoto = prefs.getString('userUrlPhoto').toString();
    });
  }

  void initState() {
    super.initState();
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        apiKategori();
      });
    });
  }

  List kategori = [];
  List laris = [];

  DataLaris l;
  DataKategori k;

  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Column(
            children: [
              //TOP BAR
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
                  margin: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: blockVertical * 1.8,
                      top: blockVertical * 2.4),
                  child: Container(
                    height: blockVertical * 8.6,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: blockHorizontal * 2.6,
                                vertical: blockVertical * 0.6),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AutoSizeText(
                                        "Toko Cabang",
                                        minFontSize: 6,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        height: blockVertical * 4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButton(
                                            dropdownColor: Color(0xff2661AB),
                                            value: valueChoose,
                                            icon: Icon(
                                              LineIcons.angleDown,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                            hint: AutoSizeText(
                                              listItem[0],
                                              minFontSize: 6,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            onChanged: (newValue) {
                                              setState(() {
                                                valueChoose =
                                                    newValue as String;
                                              });
                                            },
                                            items: listItem.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(
                                                  valueItem,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              );
                                            }).toList()),
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
              // End TopBar
              SizedBox(height: blockVertical * 2),
              (kategori.length == 0)
                  ? ShimmerCategory()
                  : Container(
                      height: 115,
                      child: ListView.builder(
                          itemCount: kategori.length,
                          padding: EdgeInsets.only(left: 0, right: 15),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 0),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 4,
                                    shape: CircleBorder(),
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              13,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              13,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${kategori[index].gambar}'),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(kategori[index].nama)
                                ],
                              ),
                            );
                          })),
              Container(
                padding: EdgeInsets.only(top: 10),
                // height: blockVertical * 70,
                height: MediaQuery.of(context).size.height / 2.05,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Color(0xff2A9FD8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      //childAspectRatio: 0.6,
                    ),
                    primary: false,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding:
                              const EdgeInsets.only(top: 2, right: 5, left: 5),
                          child: CardProductHome(
                            namaProduk: 'hallo',
                            url:
                                'https://adm.tirtakitaindonesia.com/images/foto/kategori/default.jpg',
                          ));
                    }),
              ),
            ],
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
      ),
    );
  }

  Future<DataKategori> apiKategori() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/kategori"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    DataKategori dataKategori = DataKategori.fromJson(parsed);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        kategori = dataKategori.data;
        k = dataKategori;
        setState(() {});
      }
      print(kategori[0].id);
      print(kategori[0].nama);
      print(kategori[0].gambar);

      for (var i = 0; i < dataKategori.data.length; i++) {
        print("\n");
        print('Id Kategori : ${dataKategori.data[i].id}');
        print('nama kategori :  ${dataKategori.data[i].nama}');
        print('link gambar ${dataKategori.data[i].gambar}');
        print("\n");
      }
    }
    return dataKategori;
  }
}
