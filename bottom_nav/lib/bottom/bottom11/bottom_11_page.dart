import 'dart:math';

import 'package:bottom_nav/bottom/bottom11/tabIcon_data.dart';
import 'package:bottom_nav/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'bottom_app_bar_11.dart';

/// flutter 拉面菜单
class Bottom11Page extends StatefulWidget {
  const Bottom11Page({Key? key}) : super(key: key);

  @override
  Bottom11PageState createState() => Bottom11PageState();
}

class Bottom11PageState extends State<Bottom11Page> {
  int pageIndex = 0;

  /// 图标
  final List<TabIconData> iconList = TabIconData.tabIconsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '拉面菜单',
        backgroundColor: Colors.pink.shade100,
        mainColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          content(),
          bottomBar(),
        ],
      ),
    );
  }

  final List<Color> bgs = [
    const Color(0xfffff4fc),
    const Color(0xffffe1f9),
    const Color(0xffffd2f7),
  ];

  Widget content() {
    return AnimationLimiter(
      key: UniqueKey(),
      child: GridView.builder(
        itemCount: 22,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 + (pageIndex % 3),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            childAspectRatio: 1),
        itemBuilder: (context, index) {
          final bg = bgs[Random().nextInt(3)];

          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 22,
            duration: const Duration(milliseconds: 500),
            child: ScaleAnimation(child: Container(color: bg)),
          );
        },
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: BottomAppBar11(
        iconList: iconList,
        selectedPosition: 0,
        selectedCallback: (position) => onClickBottomBar(position),
      ),
    );
  }

  void onClickBottomBar(int index) {
    if (!mounted) return;

    setState(() => pageIndex = index);
  }
}
