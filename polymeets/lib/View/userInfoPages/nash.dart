import 'package:flutter/material.dart';
import 'package:polymeets/UserInfo/island.dart';
import 'package:polymeets/View/userInfoPages/Religion.dart';

class Nash extends StatefulWidget {
  @override
  _NashState createState() => _NashState();
}

class _NashState extends State<Nash> {
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
                "Choose your Nationality",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Let them know your roots",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: Islands.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: CheckboxListTile(
                        value: _ischecked[index],
                        title: Text(Islands.values[index].toString().substring(
                            Islands.values[index].toString().indexOf('.') + 1)),
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
                        MaterialPageRoute(builder: (context) => Religion()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
    //           ElevatedButton(
    //               onPressed: () {
    //                 s();
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => LocationEnable()));
    //               },
    //               child: Text("Next")),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
