import 'package:flutter/material.dart';
import 'package:polymeets/View/userInfoPages/dob.dart';

class FirstName extends StatefulWidget {
  @override
  _FirstNameState createState() => _FirstNameState();
}

class _FirstNameState extends State<FirstName> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
          color: Colors.redAccent,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What is your First name',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DateOfBirth()));
                      }
                    },
                    child: Text('Continue'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
