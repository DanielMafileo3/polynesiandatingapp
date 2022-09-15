import 'package:flutter/material.dart';

class PolySettings extends StatefulWidget {
  const PolySettings({Key? key}) : super(key: key);

  @override
  State<PolySettings> createState() => _PolySettingsState();
}

class _PolySettingsState extends State<PolySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("SETTINGS"),
      ),
    );
  }
}
