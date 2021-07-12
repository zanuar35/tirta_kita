import 'package:flutter/material.dart';
import 'package:tirta_kita/screen/login_screen/widget/custom_button.dart';

class ContainerLogoutBtn extends StatelessWidget {
  const ContainerLogoutBtn({
    Key? key,
    required this.onPressed,
    required this.size,
    required this.blockHorizontal,
    required this.blockVertical,
  }) : super(key: key);

  final Size size;
  final double blockHorizontal;
  final double blockVertical;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 6,
      width: size.width / 1,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: blockHorizontal * 6.4, vertical: blockVertical * 1.84),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Logout Akun",
                style: TextStyle(
                    fontSize: blockHorizontal * 4.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2)),
            SizedBox(height: blockVertical * 2),
            CustomButton(
              onClicked: onPressed,
              height: (blockVertical) * 6.7,
              fontWeight: FontWeight.w400,
              text: 'Keluar Akun',
              color: Color(0xff2BBAEC),
            )
          ],
        ),
      ),
    );
  }
}
