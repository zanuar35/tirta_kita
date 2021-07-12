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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        'https://i.ibb.co/z4zCXW6/Rectangle-116.png'),
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
                hintText: 'Masukkan nama',
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
