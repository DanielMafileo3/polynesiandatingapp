import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:polymeets/DB/search.dart';
import 'package:polymeets/View/inbox.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<String> n = [
    "Mele",
    "Sona",
    "Ana",
    "Lia",
    "Fia",
    "Mia",
    "Ayla",
    "Leilani",
    "Lose"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //Search tool
        actions: [
          IconButton(
              color: Colors.redAccent,
              onPressed: () {
                showSearch(context: context, delegate: Search(n));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //New Matches
                  SizedBox(height: 15),
                  Text(
                    "New Matches",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  SizedBox(height: 20),
                  //Matches & Likes-----------------------------
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg"),
                                  fit: BoxFit.cover,
                                )),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                              child: Container(
                                color: Colors.black.withOpacity(0.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Likes"),
                        ],
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 90,
                        //color: Colors.redAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 110,
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg",
                                    fit: BoxFit.cover),
                                elevation: 5,
                              ),
                            ),
                            Text("Mele"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  //Messages--------------------
                  Text(
                    "Messages",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: _messages,
                      itemCount: n.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messages(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Inbox()));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        height: 100,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://pbs.twimg.com/profile_images/619169866713468928/b6i0YUD5_400x400.jpg",
                    height: 80,
                  ),
                ),
                SizedBox(width: 10),
                Text(n[index])
              ],
            ),
            Divider(
              indent: 20,
            )
          ],
        ),
      ),
    );
  }
}
