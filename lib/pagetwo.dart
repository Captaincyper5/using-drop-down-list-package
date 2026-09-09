import 'package:flutter/material.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});
  @override
  State<Pagetwo> createState() => _MyState();
}

class _MyState extends State<Pagetwo> {
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
                child: Text("page1"),
                value: "two",
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("page1", (route) => false);
                },
              ),
            ],
          ),
        ],
        title: Text('Page2', style: TextStyle(fontWeight: FontWeight(800))),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: 600,
        width: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.amber, Colors.green]),
        ),
      ),
    );
  }
}
