import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/model/user_profile.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';
import 'package:http/http.dart' as http;

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

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token').toString();
    });
  }

  UserProfile uP;

  void initState() {
    super.initState();
    getPref();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(microseconds: 2), () {
        apiProfile();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(token);
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
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: NetworkImage(
                            'https://i.ibb.co/6gWWJn3/map-location-icon-17-1.png'),
                        fit: BoxFit.contain,
                      ),
                      radius: 28,
                    ),
                    CoordinatTextField()
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
                text: 'Simpan',
                color: kSecondaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserProfile> apiProfile() async {
    print(token);
    var response = await http.get(
      Uri.parse("https://api.tirtakitaindonesia.com/profil"),
      headers: {'Accept': 'application/json', "Authorization": 'Bearer $token'},
    );
    //final Map parsed = json.decode(response.body);
    // DataKategori dataKategori = DataKategori.fromJson(parsed);
    UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
    Data data = userProfile.data;
    if (response.statusCode == 200) {
      uP = userProfile;
      setState(() {});
    }
    print(data.foto);
    print(data.email);
  }
}

class CoordinatTextField extends StatelessWidget {
  const CoordinatTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 130,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: '-7.2636382, 122.971271972',
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
