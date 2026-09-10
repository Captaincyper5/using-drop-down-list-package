import 'package:flutter/material.dart';

class Custom extends SearchDelegate {
  List username = ["ali", "ahmed", "omar", "mhammad"];
  List? filter;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: username.length,
        itemBuilder: (context, i) {
          return Card(
            child: MaterialButton(
              onPressed: () {
                query = username[i];
                showResults(context);
              },
              child: Text(username[i]),
            ),
          );
        },
      );
    } else {
      filter = username.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemCount: filter!.length,
        itemBuilder: (context, i) {
          return Card(
            child: MaterialButton(
              onPressed: () {
                query = filter![i];
                showResults(context);
              },
              child: Text(filter![i]),
            ),
          );
        },
      );
    }
  }
}
