import 'package:app2/home.dart';
import 'package:app2/pageone.dart';
import 'package:app2/pagetwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyState();
}

class _MyState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: {"home":(context) => Home(),
    "page1":(context) => Pageone(),
    "page2":(context) => Pagetwo()},
    home: Home());
  }
}
