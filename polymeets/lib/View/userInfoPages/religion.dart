import 'package:flutter/material.dart';
import 'package:polymeets/UserInfo/rgn.dart';
import 'package:polymeets/View/userInfoPages/sports.dart';

class Religion extends StatefulWidget {
  @override
  _ReligionState createState() => _ReligionState();
}

class _ReligionState extends State<Religion> {
  List<String> mode = [
    "Christian",
    "Catholic",
    "Mormon",
    "Methodist",
    "Seven Day",
    "Dont Say"
  ];

  late Rgn _religion;

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
                "Whats Your Religion",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "This will help us match you with your potential match.",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 6,
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
                            value: Rgn.values.elementAt(index),
                            groupValue: _religion,
                            onChanged: (value) {
                              setState(() {
                                //_religion = value;
                              });
                            },
                          ),
                        );
                      })),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sports()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
