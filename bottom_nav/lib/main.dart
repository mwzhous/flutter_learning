import 'package:bottom_nav/bottom/bottom_bar_page.dart';
import 'package:bottom_nav/safe/safe_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: '有趣的底部导航'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () => push(
              const SafePage(),
            ),
            child: const Text('拖动验证器'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => push(
              const BottomBarPage(),
            ),
            child: const Text('各种底部导航'),
          ),
        ]),
      ),
    );
  }

  push(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
