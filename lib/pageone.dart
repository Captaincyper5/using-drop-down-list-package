import 'package:flutter/material.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});
  @override
  State<Pageone> createState() => _MyState();
}

class _MyState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onOpened: () {
              print("openned");
            },
            onCanceled: () {
              print("closed");
            },
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("home"),
                value: "one",
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("home", (route) => false);
                },
              ),
              PopupMenuItem(
                child: Text("page2"),
                value: "two",
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("page2", (route) => false);
                },
              ),
            ],
          ),
        ],
        title: Text('Page1', style: TextStyle(fontWeight: FontWeight(800))),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: 600,
        width: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pink, Colors.orange]),
        ),
      ),
    );
  }
}
