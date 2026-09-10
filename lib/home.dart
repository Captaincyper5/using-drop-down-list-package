import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  late ScrollController scrollx;
  @override
  void dispose() {
    scrollx.dispose();
    super.dispose();
  }

  @override
  void initState() {
    scrollx = ScrollController();
    scrollx.addListener(() {
      print("${scrollx.offset}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome                          مرحبا بك',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        controller: scrollx,
        clipBehavior: Clip.none,
        children: [
          MaterialButton(
            onPressed: () {
              scrollx.animateTo(
                906,
                duration: Duration(seconds: 5),
                curve: Curves.ease,
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF605757),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.arrow_downward, color: Colors.white),
            ),
          ),
          ...List.generate(
            30,
            (index) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: index.isEven
                      ? [Colors.amber, Colors.blue]
                      : [Colors.purple, Colors.green],
                ),
              ),
              child: Text(
                "$index",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              scrollx.animateTo(
                0,
                duration: Duration(seconds: 5),
                curve: Curves.ease,
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF605757),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.arrow_upward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
