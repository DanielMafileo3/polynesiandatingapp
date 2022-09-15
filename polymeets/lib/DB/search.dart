import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  //final List<String> listExample;
  final List<String> names;
  List<String> recentList = ["Mele", "Fia", "Sonia", "Paris"];

  Search(this.names);

  @override
  //this method returns a list of widgets
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  //this method returns a container with results
  Widget buildResults(BuildContext context) {
    final suggestionList = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestionList.elementAt(index),
          ),
        );
      },
    );
    // return Container(
    //     child: Center(
    //   child: Text(selectedResult),
    // ));
  }

  @override
  //this method will return an auxiliary list
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = names.where((name) {
      return name.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestionList.elementAt(index),
          ),
          onTap: () {
            query = suggestionList.elementAt(index);
          },
        );
      },
    );

    // List<String> suggestionList = [];
    // query.isEmpty
    //     ? suggestionList = recentList
    //     : suggestionList.addAll(listExample.where(
    //         (element) => element.contains(query),
    //       ));

    // return ListView.builder(
    //   itemCount: suggestionList.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(suggestionList[index]),
    //       onTap: () {
    //         selectedResult = suggestionList[index];
    //         showResults(context);
    //       },
    //     );
    //   },
    // );
  }
}
