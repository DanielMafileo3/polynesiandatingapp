import 'package:flutter/material.dart';
import 'package:polymeets/UserInfo/modechoose.dart';
import 'package:polymeets/View/userInfoPages/nash.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  List<String> mode = ["Date", "BFF", "Lazy Meet Ups"];
  List<String> subTitle = [
    "Find your loce one in this community",
    "Make friends at every stage of your life",
    "Just in it for the fun"
  ];

  late ModeChoose _modeChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.redAccent,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose your Mode to get started",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We'll let you know when you get new matches and messages.",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RadioListTile(
                            title: Text(mode[index].toString()),
                            subtitle: Text(subTitle[index].toString()),
                            value: ModeChoose.values.elementAt(index),
                            groupValue: _modeChoose,
                            onChanged: (value) {
                              setState(() {
                                // _modeChoose = value;
                              });
                            },
                          ),
                        );
                      })),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Nash()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
