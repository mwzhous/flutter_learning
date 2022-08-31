import 'package:bottom_nav/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'salomon_bottom_bar.dart';

class Bottom12Page extends StatefulWidget {
  const Bottom12Page({Key? key}) : super(key: key);

  @override
  Bottom12PageState createState() => Bottom12PageState();
}

class Bottom12PageState extends State<Bottom12Page> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'salomon底部导航',
        backgroundColor: Colors.deepPurple.shade400,
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: true,
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.purple,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text("Likes"),
                selectedColor: Colors.pink,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        _currentIndex.toString(),
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 80,
        ),
      ),
    );
  }
}
