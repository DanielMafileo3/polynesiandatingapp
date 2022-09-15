import 'package:flutter/material.dart';
import 'package:polymeets/Camera/imagemaker.dart';
import 'package:polymeets/View/userpreview.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Edit Info",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(tabs: [
            Tab(
                child: Text(
              "Edit",
              style: TextStyle(color: Colors.black),
            )),
            Tab(
              child: Text(
                "Preview",
                style: TextStyle(color: Colors.black),
              ),
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Add Media",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Add or change your photos by \n pressing on the plus symbol",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ImageMaker(), ImageMaker(), ImageMaker()],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ImageMaker(), ImageMaker(), ImageMaker()],
                  ),
                  Row(),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 380,
                height: 680,
                child: UserPreview(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
