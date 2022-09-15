import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polymeets/View/messages.dart';
import 'package:polymeets/View/swipe.dart';
import 'package:polymeets/View/userprofile.dart';

//Link to DB
final List data = [
  {'color': Colors.red},
  {'color': Colors.green},
  {'color': Colors.blue},
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [UserProfile(), Swipe(), Messages()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 10,
            selectedIconTheme:
                IconThemeData(color: Colors.purple[800], size: 30),
            //selectedItemColor: Colors.amberAccent,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.shifting,
            unselectedIconTheme: IconThemeData(
              color: Colors.black26,
            ),
            //unselectedItemColor: Colors.deepOrange,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.user,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.spa,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.comment,
                  ),
                  label: '')
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
        body: tabs[_currentIndex]);
  }
}
