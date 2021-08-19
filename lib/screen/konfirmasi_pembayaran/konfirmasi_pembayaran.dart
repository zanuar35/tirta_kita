import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tirta_kita/screen/camera_page/camera_page.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class KonfirmasiPembayaran extends StatefulWidget {
  // const KonfirmasiPembayaran({ Key? key }) : super(key: key);

  @override
  State<KonfirmasiPembayaran> createState() => _KonfirmasiPembayaranState();
}

class _KonfirmasiPembayaranState extends State<KonfirmasiPembayaran> {
  @override
  Widget build(BuildContext context) {
    double blockHorizontal = (MediaQuery.of(context).size.width) / 100;
    double blockVertical = (MediaQuery.of(context).size.height) / 100;
    File _image;
    final imagePicker = ImagePicker();

    Future getImage() async {
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = File(image.path);
      });
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
                        Navigator.of(context).pop();
                        getImage();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.filter),
                      title: Text('Galeri'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )),
      );
    }

    File imageFile;

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
                      imageFile = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraPage(),
                        ),
                      );
                      setState(() {
                        imageFile = imageFile;
                      });
                    },
                    child: Container(
                      height: blockVertical * 40,
                      width: blockVertical * 40,
                      child: imageFile == null
                          ? Center(
                              child: Icon(
                                LineIcons.alternateCloudUpload,
                                size: blockHorizontal * 26,
                              ),
                            )
                          : Image.file(imageFile),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 3, color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
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
}
