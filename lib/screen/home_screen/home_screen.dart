import 'package:flutter/material.dart';
import 'package:tirta_kita/constants.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.30,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.30 - 27,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 65,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 70,
                                color: Colors.black.withOpacity(0.4))
                          ]),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.red,
            height: 20,
            width: 100,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
