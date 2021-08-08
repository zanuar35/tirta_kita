import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tirta_kita/model/cabang_model.dart';
import 'package:tirta_kita/model/kategori_model.dart';
import 'package:tirta_kita/model/laris_model.dart';
import 'package:tirta_kita/model/orderProduct_model.dart';
import 'package:tirta_kita/model/product.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';
import 'package:http/http.dart' as http;
import 'package:tirta_kita/screen/product_screen/widget/productCard.dart';
import 'package:tirta_kita/screen/product_screen/widget/shimmerCategory.dart';
import 'package:badges/badges.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key key,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String valueChoose;

  String urlPhoto = '';
  String token = '';
  String kategoriId = '';
  String cabangId = '1';
  String search = '';

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
        apiProduct();
        apiCabang();
      });
    });
  }

  List kategori = [];
  List laris = [];
  List product = [];
  List cabang = [];
  List cabangItem = [];
  List<OrderProductModel> orderProduct = [];

  DataLaris l;
  DataKategori k;
  DataProduct p;
  DataCabang c;

  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: DropdownButton(
                                              dropdownColor: Color(0xff2661AB),
                                              value: valueChoose,
                                              icon: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Icon(
                                                  LineIcons.angleDown,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              hint: AutoSizeText(
                                                (cabangItem.length == 0)
                                                    ? 'Loading'
                                                    : cabangItem[0],
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
                                                  cabangId =
                                                      (cabangItem.indexOf(
                                                                  newValue) +
                                                              1)
                                                          .toString();
                                                  print(cabangId);
                                                });
                                                apiProduct();
                                              },
                                              items:
                                                  cabangItem.map((valueItem) {
                                                return DropdownMenuItem(
                                                  value: valueItem,
                                                  child: Text(
                                                    valueItem,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  onSubmitted: (value) {
                                    search = value;
                                    setState(() {});
                                    apiProduct();
                                  },
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
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          kategoriId = (index + 1).toString();
                                        });
                                        apiProduct();
                                      },
                                      child: Card(
                                        elevation: 4,
                                        shape: CircleBorder(),
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              13,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height /
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
                  child: (product.length == 0)
                      ? Container(
                          height: blockVertical * 7,
                          child: Shimmer.fromColors(
                            baseColor: Color(0xffffffff),
                            highlightColor: Color(0xffE6E3FF),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                  //childAspectRatio: 0.6,
                                ),
                                primary: false,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, right: 5, left: 5),
                                      child: CardProductHome(
                                        namaProduk: '',
                                        harga: '',
                                        url: '',
                                      ));
                                }),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            //childAspectRatio: 0.6,
                          ),
                          primary: false,
                          itemCount: product.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, right: 1, left: 1),
                                child: CardProductHome(
                                  namaProduk: product[index].nama,
                                  harga: product[index].harga,
                                  url: product[index].urlFoto,
                                  onPressed: () {
                                    setState(() {
                                      orderProduct.add(OrderProductModel(
                                          product[index].id,
                                          product[index].nama,
                                          product[index].kategoriId,
                                          product[index].stok,
                                          product[index].harga,
                                          product[index].urlFoto));
                                      //orderProduct.clear();
                                    });
                                    for (var i = 0;
                                        i < orderProduct.length;
                                        i++) {
                                      print(orderProduct[i].id);
                                      print(orderProduct[i].nama);
                                      print(orderProduct[i].harga);
                                      print('\n\n');
                                    }
                                  },
                                ));
                          }),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.89, 0.89),
            child: FloatingActionButton(
                child: Badge(
                  toAnimate: true,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  badgeContent: Text('${orderProduct.length}',
                      style: TextStyle(color: Colors.white)),
                  child: Icon(
                    LineIcons.shoppingCart,
                    size: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        orderProduct: orderProduct,
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }

// Api kategori
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
    }
    return dataKategori;
  }

// Api Cabang
  Future<DataCabang> apiCabang() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/cabang"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    DataCabang dataCabang = DataCabang.fromJson(parsed);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        cabang = dataCabang.data;
        c = dataCabang;
        setState(() {});
      }
      for (var i = 0; i < cabang.length; i++) {
        print(cabang[i].id);
        print(cabang[i].nama);
        print(cabang[i].alamat);
        print(cabang[i].jarak);
        print(cabang[i].harga);
        print('\n');
      }
      for (var i = 0; i < cabang.length; i++) {
        if (cabang[i].jarak != null) {
          cabangItem.add(cabang[i].nama + ' ' + '(${cabang[i].jarak} Km) ');
        } else {
          cabangItem.add(cabang[i].nama);
        }
      }
      for (var i = 0; i < cabangItem.length; i++) {
        print(cabangItem);
      }
    }

    return dataCabang;
  }

// Api Product
  Future<DataKategori> apiProduct() async {
    var response = await http.post(
        Uri.parse("https://api.tirtakitaindonesia.com/produk"),
        headers: {
          'Accept': 'application/json',
          "Authorization": 'Bearer $token'
        },
        body: ({'cabang': cabangId, 'kategori': kategoriId, 'search': search}));
    final Map parsed = json.decode(response.body);
    DataKategori dataKategori = DataKategori.fromJson(parsed);
    DataProduct dataProduct = DataProduct.fromJson(parsed);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        product = dataProduct.data;
        p = dataProduct;
        setState(() {});
        print('Get data berhasil');
      }
    } else {
      print(dataProduct.message);
    }
    return dataKategori;
  }
}
