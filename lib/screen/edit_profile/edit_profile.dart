// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/model/ubahProfile_model.dart';
import 'package:tirta_kita/model/user_profile.dart';
import 'package:tirta_kita/screen/edit_profile/widgets/coordinatTextField.dart';
import 'package:tirta_kita/screen/map_screen/mapScreen.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class EditProfile extends StatefulWidget {
  //const EditProfile({ Key? key }) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  String token = '';
  String tanggal = '';
  String urlFoto;
  String nama = '';

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
      urlFoto = prefs.getString('userUrlPhoto').toString();
      nama = prefs.getString('userName').toString();
    });
  }

  UserProfile uP;
  UbahProfile ubahProfile;
  DateTime date = DateTime.now();
  Data data;

  void initState() {
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(microseconds: 2), () {
        apiProfile();
      });
    });
    super.initState();
  }

  double lokasiLatitude;
  double lokasiLongitude;

  double lat;
  double long;

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lokasiLatitude = position.latitude;
      lokasiLongitude = position.longitude;
    });
    print(lokasiLatitude);
    print(lokasiLongitude);
  }

  @override
  Widget build(BuildContext context) {
    print(' === build screen ===');

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(LineIcons.angleLeft)),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: (data == null)
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: Image(
                          image: NetworkImage(
                            urlFoto,
                            // 'https://adm.tirtakitaindonesia.com/images/foto/kustomer/default.jpg'
                            // 'https://i.ibb.co/z4zCXW6/Rectangle-116.png'
                          ),
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Input nama
                    LabelText(text: 'Nama'),
                    InputText(
                      hintText: nama,
                      controller: _nameController,
                    ),
                    // Input no hp
                    LabelText(
                      text: 'No Handphone',
                    ),
                    InputNo(
                      controller: _noTelpController,
                      hintText: data.telepon,
                      prefixText: '+62',
                    ),
                    LabelText(
                      text: 'Tanggal Lahir',
                    ),
                    InkWell(
                        onTap: () {
                          selectTimePicker(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  '${date.year.toString()} - ' +
                                      '${date.month.toString()} - ' +
                                      '${date.day.toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                LineIcons.calendar,
                                color: Colors.blue,
                                size: 40,
                              )
                            ],
                          ),
                        )),
                    // input alamat
                    LabelText(text: 'Alamat'),
                    InputText(
                      hintText: data.alamat,
                      controller: _addressController,
                    ),
                    LabelText(text: 'Lokasi Pengiriman'),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              _awaitReturnValueFromSecondScreen(context);
                              //_getCurrentLocation();
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => MapScreen()),
                              // ).then((value) => setState(() {}));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image(
                                image: NetworkImage(
                                    'https://i.ibb.co/6gWWJn3/map-location-icon-17-1.png'),
                                fit: BoxFit.contain,
                              ),
                              radius: 28,
                            ),
                          ),
                          CoordinatTextField(
                            latitude: (lat == null)
                                ? data.latitude
                                : lat.toStringAsFixed(5),
                            longitude: (long == null)
                                ? data.longitude
                                : long.toStringAsFixed(5),
                          )
                        ]),
                    // input email
                    LabelText(text: 'Email'),
                    InputText(
                      hintText: (data.email == null) ? '' : data.email,
                      controller: _emailController,
                    ),
                    // input password
                    LabelText(text: 'Password'),
                    InputPassword(
                      controller: _passwordController,
                      hintText: 'masukkan password',
                    ),
                    SizedBox(height: 3),
                    Text('Hanya bila ingin merubah password',
                        style: TextStyle(
                            color: Colors.red, fontStyle: FontStyle.italic)),
                    SizedBox(height: 30),
                    // Tombol simpan
                    Button(
                      onPress: apiUbahProfile,
                      text: 'Simpan',
                      color: kSecondaryColor,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    //openMap();
    String result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      lat = prefs.getDouble('Lat');
      long = prefs.getDouble('Long');
    });
  }

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  Future<UserProfile> apiProfile() async {
    print(token);
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/profil"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
    data = userProfile.data;
    if (response.statusCode == 200) {
      uP = userProfile;
      setState(() {});
    }
    print('Get Data User');
    print(data.foto);
    print(data.email);
    return userProfile;
  }

  Future<UbahProfile> apiUbahProfile() async {
    if (_emailController.text.isEmpty ||
        _noTelpController.text.isEmpty ||
        date == null ||
        _addressController.text.isEmpty) {
      EasyLoading.showError('Data tidak boleh kosong');
    } else {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      double lat;
      double long;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        lat = prefs.getDouble('Lat');
        long = prefs.getDouble('Long');
      });

      var response = await http.post(
          Uri.parse("https://api.tirtakitaindonesia.com/profil_ubah"),
          headers: {
            'Accept': 'application/json',
            "Authorization": 'Bearer $token'
          },
          body: ({
            'email': _emailController.text,
            //'Luis4621464@sambako.com', 
            'password': (_passwordController.text == null)
                ? ''
                : _passwordController.text,
            'tanggal_lahir': '${date.year.toString()}-' +
                '${date.month.toString()}-' +
                '${date.day.toString()}',
            'telepon': '0' + _noTelpController.text, //'089678833231',
            'alamat': _addressController.text,
            'latitude': lat.toString(),
            'longitude': long.toString(),
          }));
      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Ubah profile Success');
      } else {
        print(response.statusCode);
        print('Ubah data gagal');
        EasyLoading.showError('Ubah data Gagal');
      }
    }
    return ubahProfile;
  }
}
