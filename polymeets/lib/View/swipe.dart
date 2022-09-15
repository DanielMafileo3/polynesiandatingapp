// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polymeets/View/userprofile.dart';

//Link to DB
final List data = [
  {'color': Colors.red},
  {'color': Colors.green},
  {'color': Colors.blue},
  {'color': Colors.orange},
];

class Swipe extends StatefulWidget {
  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  List<String> photos = [
    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg",
    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg",
    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg",
    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg"
  ];

  List<Card> cards = [
    Card(
      data[0]['color'],
    ),
    Card(
      data[1]['color'],
    ),
    Card(
      data[2]['color'],
    ),
    Card(
      data[3]['color'],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              MdiIcons.heart,
              color: Colors.blueGrey,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("polymeets",
              style: TextStyle(
                  color: Colors.purple[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: 'PoiretOne')),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.tuneVariant,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              children: cards,
            ),
          ),
        ));
  }
}

class Card extends StatelessWidget {
  final Color color;
  Card(this.color);

  Widget getUsersImages() {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeRight: (finalPosition) {
        print('Swipe Right');
      },
      onSwipeLeft: (finalPosition) {
        print('Swipe Left');
      },
      onSwipeUp: (finalPosition) {
        print("Super Like");
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 5) // changes position of shadow
                      )
                ],
                image: DecorationImage(
                  image: NetworkImage(
                      "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50)),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0)
                  ]),
            ),
          ),
          Positioned(
              left: 300,
              right: 20,
              bottom: 50,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: Container(
                          alignment: Alignment.center,
                          child: Text("polymeets",
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'PoiretOne')),
                        ),
                        content: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                getUsersImages(),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 200,
                                  //alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Age',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            MdiIcons.island,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Country',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            MdiIcons.mapMarkerOutline,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Location',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //Images
                                Row(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            getUsersImages(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            getUsersImages(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            getUsersImages(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            getUsersImages(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                padding: EdgeInsets.all(0),
                                primary: Colors.white.withOpacity(0),
                                onPrimary: Colors.black),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.purple]),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 500,
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )),
                            ),
                          )
                        ]),
                  );
                },
                child: Ink(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.purple]),
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      MdiIcons.accountOutline,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(0),
                    primary: Colors.white.withOpacity(0),
                    onPrimary: Colors.white),
              )),
          Positioned(
              left: 20,
              right: 0,
              bottom: 50,
              child: Container(
                //alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.briefcaseOutline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Occupation',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.island,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Country',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
