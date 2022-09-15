// ignore_for_file: unnecessary_new

import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polymeets/Camera/imagesorcetype.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:polymeets/UserInfo/island.dart';
import 'package:polymeets/UserInfo/user.dart';
import 'package:polymeets/View/edituser.dart';
import 'package:polymeets/View/polysettings.dart';
import 'package:polymeets/View/safety.dart';
import 'package:polymeets/View/swipe.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:polymeets/View/upgrade.dart';

import 'package:polymeets/View/login.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  double bottomCorners = 200;
  File? image;

  int _current = 0;
  List imgList = [
    'https://i.pinimg.com/originals/95/2f/0c/952f0cb840b4ad5bd5c3d981f520e3b7.jpg',
    'https://i1.sndcdn.com/artworks-000310318191-iu91mf-t500x500.jpg',
    'https://www.triplejunearthed.com/sites/default/files/artists/public/7/9/8/2/1/6/1//77a97d30-f26e-47b7-8005-f2e40763529f.png',
    'https://i1.sndcdn.com/artworks-Irz1AXZkPIzOsNZu-4rJXkw-t500x500.jpg',
    'https://pbs.twimg.com/media/EQKLFXoUEAUvgOj.jpg'
  ];
  bool _isLoggedIn = false;
  Map _userObj = {};

  UsersInfo userinfo = new UsersInfo(
      "Sione",
      "",
      "horse",
      27,
      [Islands.Tongan, Islands.CookIslander],
      0481234567,
      "Being a eshay lad",
      "Brisbane, AUS",
      "horses",
      true,
      true,
      "Lazy Meetups");

  //users info
  late String name;

  //final _auth = FirebaseAuth.instance;

  //island
  String nash() {
    String n = "";
    for (Islands i in userinfo.nationality!) {
      if (i == userinfo.nationality!.last) {
        n += i.toString().substring(i.toString().indexOf('.') + 1);
      } else {
        n += i.toString().substring(i.toString().indexOf('.') + 1) + " / ";
      }
    }
    return n;
  }

  Future pickImage(ImageSource e) async {
    try {
      final image = await ImagePicker().pickImage(source: e);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Widget camerabutton(String title, Icon i, ImageSource e) {
    return ElevatedButton(
      onPressed: () {
        pickImage(e);
        Navigator.of(context).pop();
      },
      child: Ink(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              i,
              SizedBox(
                width: 10,
              ),
              Text(title)
            ],
          )),
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  Widget topButtons(String title, Icon i) {
    double h = 0;
    if (title == "ADD MEDIA") {
      h = 40;
    } else {
      h = 0;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            switch (title) {
              case "ADD MEDIA":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditUser()));
                break;
              case "SETTINGS":
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PolySettings()));
                break;
              case "SAFETY":
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Safety()));
                break;
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,

                //Icon
                child: i),
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(5),
              primary: Colors.white54,
              onPrimary: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        //Title
        Text(title, style: TextStyle(color: Colors.black54)),
        SizedBox(
          height: h,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.red,
                      Colors.purple,
                    ]),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Polymeets Premium",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Unlock all features with this upgrade",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Upgrade()));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.red, Colors.purple]),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          width: 300,
                          height: 80,
                          alignment: Alignment.center,
                          child: Text(
                            'Upgrade from \$9.99',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.red,
                          fixedSize: Size(300, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                    SizedBox(height: 5),
                    //Table
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(90),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.symmetric(
                            inside:
                                BorderSide(width: 1, color: Colors.white10)),
                        children: [
                          TableRow(children: [
                            Center(
                              child: Text(
                                '',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Premium',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Normal',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Center(
                              child: Text(
                                'Unlimited likes',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Center(
                                child: Icon(
                              MdiIcons.checkCircleOutline,
                              color: Colors.green,
                            )),
                            Center(child: Text('')),
                          ]),
                          TableRow(children: [
                            Center(
                              child: Text(
                                'See who likes you',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Center(
                                child: Icon(
                              MdiIcons.checkCircleOutline,
                              color: Colors.green,
                            )),
                            Center(child: Text('')),
                          ]),
                          TableRow(children: [
                            Center(
                              child: Text(
                                'Advance filters',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Center(
                                child: Icon(
                              MdiIcons.checkCircleOutline,
                              color: Colors.green,
                            )),
                            Center(child: Text('')),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 350),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(300, 100),
                    bottomRight: Radius.elliptical(300, 100)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Setting Button
                        topButtons(
                            "SETTINGS",
                            Icon(
                              MdiIcons.cog,
                              size: 40,
                              color: Colors.white,
                            )),

                        //Add media button
                        topButtons(
                            "ADD MEDIA",
                            Icon(
                              MdiIcons.camera,
                              size: 40,
                              color: Colors.white,
                            )),

                        //Safety Wellbeing button
                        topButtons(
                            "SAFETY",
                            Icon(
                              MdiIcons.shield,
                              size: 40,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    //color: Colors.amber,
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        image != null
                            ? ClipOval(
                                child: Image.file(
                                  image!,
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                                //child: Image.file(image),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://yt3.ggpht.com/ytc/AKedOLTIU-6E7DgRtFIaCarOzDJn074QRX0ERATzLGmjZw=s900-c-k-c0x00ffffff-no-rj'),
                                radius: 60,
                              ),
                        Positioned(
                            height: 50,
                            bottom: 2,
                            right: -18,
                            child: RawMaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Center(
                                            child: Text("Choose Photo"),
                                          ),
                                          content: Container(
                                            height: 140,
                                            width: 250,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                camerabutton(
                                                    "Pick Gallery",
                                                    Icon(Icons.image),
                                                    ImageSource.gallery),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                camerabutton(
                                                    "Pick Camera",
                                                    Icon(Icons.camera),
                                                    ImageSource.camera),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.close),
                                            )
                                          ],
                                        ));
                              },
                              elevation: 2.0,
                              fillColor: Color(0xFFF5F6F9),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Color.fromARGB(255, 192, 0, 209),
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Name, Age ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
