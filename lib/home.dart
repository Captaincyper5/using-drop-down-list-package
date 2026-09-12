import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  List data = [];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: MaterialButton(
              onPressed: () async {
                loading = true;
                setState(() {});
                var response = await get(
                  Uri.parse("https://jsonplaceholder.org/posts"),
                );
                var responsex = jsonDecode(response.body);
                data.addAll(responsex);
                print(responsex);
                loading = false;
                setState(() {});
              },
              child: Text("request", style: TextStyle(color: Colors.white)),
            ),
          ),
          if (loading) Center(child: CircularProgressIndicator()),
          ...List.generate(
            data.length,
            (index) => Card(
              child: ListTile(
                title: Text("${data[index]["title"]}"),
                subtitle: Text("${data[index]["content"]}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
