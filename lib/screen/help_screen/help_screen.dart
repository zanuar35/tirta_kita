import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class HelpScreen extends StatefulWidget {
  //const HelpScreen({ Key? key }) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List data = [
    {
      'title': 'Bantuan 1',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    {
      'title': 'Bantuan 2',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    {
      'title': 'Bantuan 3',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    },
    {
      'title': 'Bantuan 4',
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    }
  ];

  String selectedData;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(LineIcons.angleLeft),
        ),
        title: Text(
          'Bantuan',
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400)),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff2662AC), Color(0xff2BB8EA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth - (screenWidth - 24),
            vertical: screenHeight - (screenHeight - 12),
          ),
          child: ListView(
            children: <Widget>[
              // ExpansionPanel(
              //     headerBuilder: (BuildContext context, bool isExpanded) {
              //       return Container();
              //     },
              //     body: body),
              ExpansionPanelList(
                children: data.map((e) {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(e['title']),
                        );
                      },
                      body: ListTile(
                        title: Text(e['desc']),
                      ),
                      isExpanded: selectedData == e['title'] ? true : false);
                }).toList(),
                expansionCallback: (int index, bool isExpanded) {
                  if (isExpanded == false) {
                    setState(() {
                      selectedData = data[index]['title'];
                    });
                  } else {
                    setState(() {
                      selectedData = '';
                    });
                  }
                },
                animationDuration: Duration(milliseconds: 450),
                expandedHeaderPadding: EdgeInsets.all(2),
              )
            ],
          )),
    );
  }
}
