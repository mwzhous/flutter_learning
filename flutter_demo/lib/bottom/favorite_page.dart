import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 用Container包裹Scaffold，设置背景图充满
    return Scaffold(
      backgroundColor: Colors.transparent,
      // AppBar设置背景色透明，取消阴影
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('最喜欢的'),
        centerTitle: false,
      ),
    );
  }
}
