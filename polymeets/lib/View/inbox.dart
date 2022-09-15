import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(8),
          child: Text("This Works!"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // FirebaseFirestore.instance
          //     .collection('chats/fLDVGIfuxOFjoxeAja9i/messages')
          //     .snapshots()
          //     .listen((data) {
          //   print(data.docs[0]['text']);
          // });
        },
      ),
    );
  }
}
