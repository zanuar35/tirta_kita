import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'dart:io';

class KonfirmasiPembayaran extends StatefulWidget {
  // const KonfirmasiPembayaran({ Key? key }) : super(key: key);

  @override
  State<KonfirmasiPembayaran> createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  @override
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
}
