import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class KonfirmasiPembayaran extends StatefulWidget {
  KonfirmasiPembayaran({Key key, this.id}) : super(key: key);
  final int id;

  @override
  State<KonfirmasiPembayaran> createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  String token = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  @override
  void initState() {
    getId();
    getPref();
    super.initState();
  }

  XFile _image;
  final imagePicker = ImagePicker();
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
                  child: InkWell(
                    onTap: () async {
                      _selectPhoto();
                      getId();
                      print(_id);
                    },
                    child: Container(
                      height: blockVertical * 40,
                      width: blockVertical * 40,
                      child: _image == null
                          ? Center(
                              child: Icon(
                                LineIcons.alternateCloudUpload,
                                size: blockHorizontal * 26,
                              ),
                            )
                          : Image.file(File(_image.path), fit: BoxFit.contain),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: _image == null
                            ? Border.all(width: 3, color: Color(0xffCCCCCC))
                            : Border.all(width: 0, color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 3,
                            blurRadius: 15,
                            offset: Offset(0, 8), // changes position of shadow
                          )
                        ],
                      ),
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
                  onPress: upload,
                  text: 'Konfirmasi',
                  color: Color(0xff2BBAEC),
                )
              ],
            ),
          )),
    );
  }

  Future _selectPhoto() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
          onClosing: () {},
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                    onTap: () {
                      pickImageCamera();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.filter),
                    title: Text('Galeri'),
                    onTap: () {
                      pickImageGallery();
                      Navigator.pop(context);
                    },
                  )
                ],
              )),
    );
  }

  int _id;

  void getId() async {
    setState(() {
      _id = widget.id;
    });
  }

  void pickImageCamera() async {
    XFile gambar = await ImagePicker().pickImage(source: ImageSource.camera);
    print(gambar.path);

    setState(() {
      _image = gambar;
    });
    print('---');
    print(_image.path);
  }

  void pickImageGallery() async {
    XFile gambar = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(gambar.path);

    setState(() {
      _image = gambar;
    });
    print('---');
    print(_image.path);
  }

  Future upload() async {
    EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    print(_image.name);
    FormData data = FormData.fromMap({
      "id": _id,
      "bukti": await MultipartFile.fromFile(
        _image.path,
        filename: _image.name,
      )
    });

    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer $token";

    dio
        .post("https://api.tirtakitaindonesia.com/konfirmasi_order", data: data)
        .then((response) {
      if (response.statusCode == 200) {
        print(response);
        EasyLoading.showSuccess("Konfirmasi Pembayaran Berhasil");
        Timer(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      } else {
        EasyLoading.showError('Konfirmasi pembayaran Gagal');
      }
    }).catchError((error) => print(error));
  }
}
