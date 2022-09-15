import 'package:flutter/material.dart';
import 'package:polymeets/UserInfo/islandchoose.dart';
import 'package:polymeets/View/userInfoPages/location.dart';

class NashDating extends StatefulWidget {
  @override
  _NashDatingState createState() => _NashDatingState();
}

class _NashDatingState extends State<NashDating> {
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
    false,
    false,
    false
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
                "Which nash are you into?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Finding your island",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: IslandChoose.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: CheckboxListTile(
                        value: _ischecked[index],
                        title: Text(IslandChoose.values[index]
                            .toString()
                            .substring(IslandChoose.values[index]
                                    .toString()
                                    .indexOf('.') +
                                1)),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationEnable()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
