import 'package:flutter/material.dart';
import 'package:app2/searchdelegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  // استخدام القائمة للتحكم في الأبعاد بأمان
  final List<double> cardWidths = [200.0, 300.0];
  final List title = ["to search click the icon", "اضغط على الايقونة للبحث"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome                    مرحبا بك'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Custom());
            },
            icon: const Icon(
              Icons.search,
            ), // تغيير الأيقونة إلى بحث لتكون أوضح للمستخدم
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 250,
            left: 0,
            bottom: 0,
            right: 0,
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title[i], textAlign: TextAlign.center),
                    SizedBox(width: 10),
                    Icon(Icons.search),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
