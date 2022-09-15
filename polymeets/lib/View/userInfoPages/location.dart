import 'package:flutter/material.dart';
import 'package:polymeets/View/userInfoPages/notification.dart';
import 'package:location/location.dart';

class LocationEnable extends StatefulWidget {
  @override
  _LocationEnableState createState() => _LocationEnableState();
}

class _LocationEnableState extends State<LocationEnable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enable Your Location",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Enabling your location will show you potential matches in your area.",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
