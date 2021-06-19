import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tirta_kita/constants.dart';
import 'package:tirta_kita/shared/widget/button.dart';
import 'package:tirta_kita/shared/widget/input_password.dart';
import 'package:tirta_kita/shared/widget/input_text.dart';
import 'package:tirta_kita/shared/widget/label_text.dart';

class EditProfile extends StatelessWidget {
  //const EditProfile({ Key? key }) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(LineIcons.angleLeft),
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
                  color: Colors.red,
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Input nama
              LabelText(text: 'Nama'),
              InputText(hintText: 'Masukkan nama'),
              // Input no hp
              LabelText(
                text: 'No Handphone',
              ),
              InputNo(
                hintText: '8123456789',
                prefixText: '+62',
              ),
              // input alamat
              LabelText(text: 'Alamat'),
              InputText(hintText: 'Alamat Rumah'),
              // input email
              LabelText(text: 'Email'),
              InputText(hintText: "ubah email"),
              // input password
              LabelText(text: 'Password'),
              InputPassword(
                controller: _passwordController,
                hintText: 'masukkan password',
              ),
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
}
