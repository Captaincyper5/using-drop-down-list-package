import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Welcome in my app'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SizedBox(height: 250),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 130),
            padding: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.leftSlide,
                  title: "dialog",
                  desc: "click",
                  btnCancelOnPress: () {},
                  btnCancelIcon: Icons.cancel,
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.check_circle,
                )..show();
              },
              child: Text("click"),
            ),
          ),
        ],
      ),
    );
  }
}
