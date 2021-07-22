import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/model/kategori_model.dart';
import 'package:tirta_kita/model/laris_model.dart';
import 'package:tirta_kita/model/user_model.dart';
import 'package:tirta_kita/screen/cart_screen/cart_screen.dart';
import 'package:tirta_kita/screen/home_screen/widgets/card_product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'widgets/category_widget.dart';
import 'widgets/promo_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nama = '';
  String urlPhoto = '';
  String token = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('userName').toString();
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
        apiLaris();
      });
    });
  }

  UserModel a;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;

    return Scaffold(
      // backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: size.height * 0.25,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: NetworkImage(
                              'https://i.ibb.co/WPpq4mk/image-4.png'),
                          fit: BoxFit.fill,
                        ),
                        height: size.height * 0.25 - 27,
                        width: size.width / 1,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32)),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.all(blockHorizontal * 1.3),
                              child: Container(
                                height: size.height - 5,
                                width: size.width - 5,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          nama.capitalizeFirst.toString(),
                                          style: TextStyle(
                                              fontSize: blockHorizontal * 3.7,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              LineIcons.certificate,
                                              size: blockVertical * 4.4,
                                            ),
                                            SizedBox(
                                                width: blockHorizontal * 2.6),
                                            Text('Silver Member')
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: blockHorizontal * 16,
                                    ),
                                    Container(
                                        height: size.height / 8,
                                        width: size.width / 8,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor),
                                        child: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(urlPhoto),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            height: blockVertical * 8.6,
                            margin: EdgeInsets.symmetric(
                                horizontal: blockHorizontal * 3.5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 25,
                                      color: Colors.black.withOpacity(0.4))
                                ]),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: blockVertical * 2.4,
                ),
                CategoryWidget(
                  url: 'https://i.ibb.co/bHrLDGc/image-2-removebg-preview.png',
                ),

                /*
                  Promo banner
                */
                PromoWidget(
                  url: 'https://i.ibb.co/kMJND02/image-3-1.png',
                ),
                SizedBox(
                  height: blockVertical * 1.23,
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: blockHorizontal * 6.4,
                        right: blockHorizontal * 6.4,
                        bottom: blockVertical * 2.95),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Paling Laris",
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: blockHorizontal * 3.7)),
                        ),
                        SizedBox(
                          height: blockVertical * 1.23,
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
                          height: blockVertical * 1.84,
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
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.89, 0.89),
            child: FloatingActionButton(
              onPressed: () {},
              child: InkWell(
                  child: Icon(
                    LineIcons.shoppingCart,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  }),
            ),
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

    for (var i = 0; i < dataKategori.data.length; i++) {
      print("\n");
      print('Id Kategori : ${dataKategori.data[i].id}');
      print('nama kategori :  ${dataKategori.data[i].nama}');
      print('link gambar ${dataKategori.data[i].gambar}');
      print("\n");
    }
    return dataKategori;
  }

  Future<DataLaris> apiLaris() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/laris"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    DataLaris dataLaris = DataLaris.fromJson(parsed);

    for (var i = 0; i < dataLaris.data.length; i++) {
      print("\n");
      print('Id laris : ${dataLaris.data[i].id}');
      print('nama produk :  ${dataLaris.data[i].nama}');
      print('kategoriId :  ${dataLaris.data[i].kategoriId}');
      print('kategoriNama : ${dataLaris.data[i].kategoriNama}');
      print('foto :  ${dataLaris.data[i].foto}');
      print("\n");
    }

    return dataLaris;
  }
}
