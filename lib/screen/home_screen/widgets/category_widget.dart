import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    this.url,
    Key key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 6,
          padding: EdgeInsets.only(left: 15, right: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    shape: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Image(
                        image: NetworkImage(url),
                        fit: BoxFit.scaleDown,
                      ),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('Kategori')
                ],
              ),
            );
          }),
    );
  }
}
