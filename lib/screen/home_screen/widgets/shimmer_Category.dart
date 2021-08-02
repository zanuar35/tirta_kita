import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategory extends StatelessWidget {
  const ShimmerCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Color(0xff2661AB),
        highlightColor: Colors.blueGrey[200],
        child: ListView.builder(
            itemCount: 4,
            padding: EdgeInsets.only(left: 0, right: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 22, right: 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: CircleBorder(),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(''), fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text('Loading')
                  ],
                ),
              );
            }),
      ),
    );
  }
}
