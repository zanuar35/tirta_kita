import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/model/failedUbahProfile.dart';
import 'package:tirta_kita/model/ubahProfile_model.dart';
import 'package:tirta_kita/model/user_profile.dart';
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

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  UserProfile uP;
  UbahProfile ubahProfile;
  DateTime date = DateTime.now();
  void initState() {
    super.initState();
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(microseconds: 2), () {
        apiProfile();
      });
    });
  }

  String lokasiLatitude = '';
  String lokasiLongitude = '';

  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lokasiLatitude = position.latitude.toString();
      lokasiLongitude = position.longitude.toString();
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  child: Image(
                    image: NetworkImage(
                        'https://adm.tirtakitaindonesia.com/images/foto/kustomer/default.jpg'
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
                hintText: 'nama',
                controller: _nameController,
              ),
              // Input no hp
              LabelText(
                text: 'No Handphone',
              ),
              InputNo(
                controller: _noTelpController,
                hintText: '8123456789',
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
                                fontSize: 16, fontWeight: FontWeight.w500)),
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
                hintText: 'Alamat Rumah',
                controller: _addressController,
              ),
              LabelText(text: 'Lokasi Pengiriman'),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //_getCurrentLocation();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()));
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
                    //Text(lokasiLatitude)
                    // CoordinatTextField(
                    //     latitude: lokasiLatitude, longitude: lokasiLongitude)
                  ]),
              // input email
              LabelText(text: 'Email'),
              InputText(
                hintText: "ubah email",
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

  Future<void> openMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=-7.3111865,112.7474688';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<UserProfile> apiProfile() async {
    print(token);
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/profil"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
    Data data = userProfile.data;
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
        _addressController.text.isEmpty) {
      EasyLoading.showError('Data tidak boleh kosong');
    } else {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      var response = await http.post(
          Uri.parse("https://api.tirtakitaindonesia.com/profil_ubah"),
          headers: {
            'Accept': 'application/json',
            "Authorization": 'Bearer $token'
          },
          body: ({
            'email': 'Luis4621464@sambako.com', //_emailController.text,
            'password': (_passwordController.text == null)
                ? ''
                : _passwordController.text,
            'tanggal_lahir': '${date.year.toString()}-' +
                '${date.month.toString()}-' +
                '${date.day.toString()}',
            'telepon': _noTelpController.text, //'089678833231',
            'alamat': _addressController.text,
            'latitude': '-7.3111865',
            'longitude': '112.7474688',
          }));
      if (response.statusCode == 200) {
        // UbahProfile ubahProfile = UbahProfile.fromJson(jsonDecode(response.body));
        print('Ubah profile Success');
        EasyLoading.showSuccess('Ubah profile Success');
      } else {
        // UbahProfileFailed ubahProfileFailed =
        //     UbahProfileFailed.fromJson(jsonDecode(response.body));
        print(response.statusCode);
        print('Ubah data gagal');
        EasyLoading.showError('Ubah data Gagal');
      }

      return ubahProfile;
    }
  }
}

class CoordinatTextField extends StatefulWidget {
  CoordinatTextField({
    this.latitude,
    this.longitude,
    Key key,
  }) : super(key: key);

  String latitude;
  String longitude;

  @override
  State<CoordinatTextField> createState() => _CoordinatTextFieldState();
}

class _CoordinatTextFieldState extends State<CoordinatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: (widget.latitude == '' && widget.longitude == '')
              ? ''
              : widget.latitude + widget.longitude,
          hintStyle: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff2A2A2A).withOpacity(0.40),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide:
                BorderSide(color: kBorderColor.withOpacity(0.3), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
