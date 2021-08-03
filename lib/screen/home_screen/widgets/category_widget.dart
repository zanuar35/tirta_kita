import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key key,
  }) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.only(left: 0, right: 15),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 0),
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
                            image: NetworkImage(
                                'https://adm.tirtakitaindonesia.com/images/foto/kategori/default.jpg'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('a')
                ],
              ),
            );
          }),
    );
  }
}
