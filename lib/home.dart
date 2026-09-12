import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  late Future<List> _apiFuture;
  Future<List> api() async {
    try {
      var response = await get(Uri.parse("https://jsonplaceholder.org/posts"))
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List;
      } else {
        throw Exception("server error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("no internet connection available");
    } catch (e) {
      throw Exception("unexpected error: $e");
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _apiFuture = api();
    });
    await _apiFuture;
  }

  @override
  void initState() {
    super.initState();
    _apiFuture = api();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List>(
        future: _apiFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check your internet connection    ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.warning, color: Colors.red),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.warning, color: Colors.red),
                        Text(
                          "تحقق من اتصال الانترنت    ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: _refresh,
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.restart_alt), Text("Retry")],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text("${snapshot.data![index]['title']}"),
                    subtitle: Text("${snapshot.data![index]['content']}"),
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
