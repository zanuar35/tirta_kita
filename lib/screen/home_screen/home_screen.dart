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
import 'package:tirta_kita/screen/home_screen/widgets/shimer_Produk.dart';
import 'package:tirta_kita/screen/home_screen/widgets/shimmer_Category.dart';
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

  List kategori = [];
  List laris = [];

  UserModel a;
  DataLaris l;
  DataKategori k;

  void initState() {
    super.initState();
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        if (kategori.length == 0) {
          apiKategori();
        }
        apiLaris();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;
    print(token);

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
                  height: size.height * 0.35 - 27,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: NetworkImage(
                              'https://i.ibb.co/WPpq4mk/image-4.png'),
                          fit: BoxFit.fill,
                        ),
                        height: size.height * 0.35,
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
                              padding: EdgeInsets.fromLTRB(
                                  blockHorizontal * 1.3,
                                  blockHorizontal * 1.3,
                                  blockHorizontal * 1.3,
                                  0),
                              child: Container(
                                height: size.height - 5,
                                width: size.width - 5,
                                //color: Colors.red,
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
                                              fontSize: blockHorizontal * 4.5,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              LineIcons.certificate,
                                              size: blockVertical * 4.7,
                                            ),
                                            SizedBox(
                                                width: blockHorizontal * 2.6),
                                            Text('Silver Member',
                                                style: TextStyle(fontSize: 14))
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
                            height: blockVertical * 10, //8.6,
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
                (kategori.length == 0)
                    ? ShimmerCategory()
                    : Container(
                        height: 120,
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
                SizedBox(
                  height: blockVertical * 1.4,
                ),
                PromoWidget(
                  url: 'https://i.ibb.co/kMJND02/image-3-1.png',
                ),
                SizedBox(
                  height: blockVertical * 2.4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: blockHorizontal * 6.4,
                    right: blockHorizontal * 6.4,
                    bottom: blockVertical * 2,
                  ),
                  child: Text(
                    "Paling Laris",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: blockHorizontal * 3.7)),
                  ),
                ),
                (laris.length == 0)
                    ? ShimmerCardProduk()
                    : Padding(
                        padding: EdgeInsets.only(
                          left: blockHorizontal * 6.4,
                          right: blockHorizontal * 6.4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: blockVertical * 1.23,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              // color: Colors.cyan,
                              width: MediaQuery.of(context).size.width / 1,
                              height: MediaQuery.of(context).size.width * 2.9,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 0.8,
                                  ),
                                  primary: false,
                                  itemCount: laris.length,
                                  itemBuilder: (context, index) {
                                    return CardProductHome(
                                        namaProduk: laris[index].nama,
                                        url: '${laris[index].foto}');
                                  }),
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

  Future<DataLaris> apiLaris() async {
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/laris"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    final Map parsed = json.decode(response.body);
    DataLaris dataLaris = DataLaris.fromJson(parsed);
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        laris = dataLaris.data;
        l = dataLaris;
        setState(() {});
      }
      print(laris[0].id);
      print(laris[0].nama);
      print(laris[0].kategoriId);
      print(laris[0].kategoriNama);
      print(laris[0].foto);
    }

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
