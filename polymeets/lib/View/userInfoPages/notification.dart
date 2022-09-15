import 'package:flutter/material.dart';
import 'package:polymeets/View/home.dart';
import 'package:polymeets/View/userprofile.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          color: Colors.redAccent,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enable Notifications",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "We'll let you know when you get new matches and messages.",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
