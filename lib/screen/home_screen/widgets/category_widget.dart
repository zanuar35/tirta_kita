import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/model/kategori_model.dart';
import 'package:http/http.dart' as http;

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key key,
  }) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String token = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  void initState() {
    super.initState();
    getPref();
    apiKategori();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(seconds: 1), () {
    //     apiKategori();
    //   });
    // });
  }

  List kategori = [];
  DataKategori k;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: kategori.length,
          padding: EdgeInsets.only(left: 0, right: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 0),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    shape: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(''), fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('a')
                ],
              ),
            );
          }),
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
      return dataKategori;
    }
  }
}
