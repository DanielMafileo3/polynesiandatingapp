import 'package:flutter/material.dart';
import 'package:polymeets/UserInfo/island.dart';
import 'package:polymeets/UserInfo/islandchoose.dart';
import 'package:polymeets/UserInfo/msc.dart';
import 'package:polymeets/UserInfo/mves.dart';
import 'package:polymeets/UserInfo/sprt.dart';
import 'package:polymeets/View/userInfoPages/location.dart';
import 'package:polymeets/View/userInfoPages/nashdating.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<bool> _ischecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Types of Music are you into",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "This will help us match you with potential matches",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: Msc.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: CheckboxListTile(
                        value: _ischecked[index],
                        title: Text(Msc.values[index].toString().substring(
                            Msc.values[index].toString().indexOf('.') + 1)),
                        onChanged: (value) {
                          setState(() {
                            _ischecked[index] = value!;
                          });
                        }),
                  );
                },
              )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NashDating()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
