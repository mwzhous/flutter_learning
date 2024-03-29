import 'package:bottom_nav/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

import 'bottom_app_bar_9.dart';
import 'tabIcon_data.dart';

class Bottom9Page extends StatefulWidget {
  const Bottom9Page({Key? key}) : super(key: key);

  @override
  Bottom9PageState createState() => Bottom9PageState();
}

class Bottom9PageState extends State<Bottom9Page> {
  final List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: '仿抖音、小红书底部菜单',
        backgroundColor: Colors.black87,
        elevation: 0,
        brightness: Brightness.dark,
      ),
      backgroundColor: const Color(0xff111111),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            content(),
            bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        child: Text(pageIndex.toString(),
            style: TextStyle(color: Colors.grey[400], fontSize: 80)),
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: BottomBar9(
        tabIconsList: tabIconsList,
        changeIndex: (index) => onClickBottomBar(index),
        addClick: () {
          debugPrint('点击了中间的按钮');
        },
      ),
    );
  }

  void onClickBottomBar(int index) {
    if (!mounted) return;

    setState(() => pageIndex = index);
  }
}
